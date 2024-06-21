// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
part 'session_metadata_store.g.dart';

class SessionMetadataStore = _SessionMetadataStoreBase
    with _$SessionMetadataStore;

abstract class _SessionMetadataStoreBase
    extends BaseMobxDBStore<NoParams, Stream<NokhteSessionMetadata>>
    with Store {
  final ListenToSessionMetadata listenLogic;
  final GetStaticSessionMetadata getterLogic;
  final GetSessionPresetInfo presetLogic;
  _SessionMetadataStoreBase({
    required this.listenLogic,
    required this.getterLogic,
    required this.presetLogic,
  });

  @observable
  int userIndex = -1;

  @action
  setUserIndex(int index) => userIndex = index;

  @observable
  bool everyoneIsOnline = false;

  @observable
  bool userIsSpeaking = false;

  @observable
  bool userCanSpeak = false;

  @observable
  ObservableList<double> currentPhases = ObservableList.of([]);

  @observable
  bool isAPremiumSession = false;

  @observable
  bool sessionHasBegun = false;

  @observable
  bool leaderIsWhitelisted = false;

  @observable
  bool isAValidSession = false;

  @observable
  bool userShouldSkipInstructions = false;

  @observable
  bool neighborShouldSkipInstructions = false;

  @observable
  bool everyoneShouldSkipInstructions = false;

  @observable
  String presetUID = '';

  @observable
  String sessionName = '';

  @observable
  ObservableList tags = ObservableList.of([]);

  @observable
  ObservableList oddConfiguration = ObservableList.of([]);

  @observable
  ObservableList evenConfiguration = ObservableList.of([]);

  @observable
  ObservableStream<NokhteSessionMetadata> sessionMetadata =
      ObservableStream(const Stream.empty());

  StreamSubscription streamSubscription =
      const Stream.empty().listen((event) {});

  dispose() async {
    await streamSubscription.cancel();
    await sessionMetadata.close();
  }

  @action
  Future<void> get(params) async {
    final result = await listenLogic(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        streamSubscription = sessionMetadata.listen((value) async {
          print("what happened?? $value");
          if (value.phases.length != currentPhases.length) {
            final res = await getterLogic(NoParams());
            res.fold((failure) => mapFailureToMessage(failure), (entity) async {
              leaderIsWhitelisted = entity.leaderIsWhitelisted;
              isAPremiumSession = entity.isAPremiumSession;
              isAValidSession = entity.isAValidSession;
              userIndex = entity.userIndex;
              presetUID = entity.presetUID;
              if (sessionName.isEmpty) {
                final res = await presetLogic(presetUID);
                res.fold((failure) => mapFailureToMessage(failure),
                    (presetEntity) {
                  sessionName = presetEntity.name;
                  tags = ObservableList.of(presetEntity.tags);
                  oddConfiguration =
                      ObservableList.of(presetEntity.oddConfiguration);
                  evenConfiguration =
                      ObservableList.of(presetEntity.evenConfiguration);
                });
              }
            });
          }
          everyoneIsOnline = value.everyoneIsOnline;
          final phases = value.phases.map((e) => double.parse(e.toString()));
          currentPhases = ObservableList.of(phases);
          sessionHasBegun = value.sessionHasBegun;
          userIsSpeaking = value.userIsSpeaking;
          userCanSpeak = value.userCanSpeak;
          // userShouldSkipInstructions = value.shouldSkipInstructions[userIndex];
          // neighborShouldSkipInstructions =
          //     userIndex == value.shouldSkipInstructions.length - 1
          //         ? value.shouldSkipInstructions.first
          //         : value.shouldSkipInstructions[userIndex + 1];
          // everyoneShouldSkipInstructions =
          //     value.shouldSkipInstructions.every((e) => e == true);
        });
        state = StoreState.loaded;
      },
    );
  }

  List<List> splitList(List motherList) {
    List evenList = [];
    List oddList = [];

    for (int i = 0; i < motherList.length; i++) {
      if (i.isEven) {
        evenList.add(motherList[i]);
      } else {
        oddList.add(motherList[i]);
      }
    }

    return [evenList, oddList];
  }

  @computed
  bool get canMoveIntoInstructions => currentPhases.every((e) => e >= 1);

  @computed
  bool get canMoveIntoSession => currentPhases.every((e) => e == 2);

  @computed
  bool get canExitTheSession => currentPhases.every((e) => e == 3);

  @computed
  bool get canReturnHome =>
      currentPhases.every((e) => e.isGreaterThanOrEqualTo(5));

  @computed
  double get userPhase => currentPhases[userIndex];

  @computed
  List get evenList => splitList(currentPhases)[0];

  @computed
  int get numberOfAffirmative {
    int count = 0;
    for (double value in currentPhases) {
      if (value == 4.0) {
        count++;
      }
    }
    return count;
  }

  @computed
  List get evenListMinusHybridPhone {
    final list = splitList(currentPhases)[0];
    list.removeAt(0);
    return list;
  }

  @computed
  List get oddList => splitList(currentPhases)[1];

  @computed
  List get everyoneButUserPhases {
    final phases = currentPhases.map((e) => e).toList();
    phases.removeAt(userIndex);
    return phases;
  }

  @computed
  bool get hybridCanMoveIntoSecondInstructionsSet =>
      evenListMinusHybridPhone.every((e) => e == 2) &&
      oddList.every((e) => e >= 1);

  @computed
  bool get canMoveIntoSecondInstructionsSet {
    if (numberOfCollaborators.isOdd) {
      return evenList.every((e) => e == 2) && oddList.every((e) => e >= 1);
    } else {
      return evenList.every((e) => e == 2) && oddList.every((e) => e >= 1);
    }
  }

  @computed
  int get numberOfCollaborators => currentPhases.length;
}
