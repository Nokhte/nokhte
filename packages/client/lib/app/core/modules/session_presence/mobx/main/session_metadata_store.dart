// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
part 'session_metadata_store.g.dart';

class SessionMetadataStore = _SessionMetadataStoreBase
    with _$SessionMetadataStore;

abstract class _SessionMetadataStoreBase
    with Store, BaseMobxLogic<Stream<NokhteSessionMetadata>> {
  final ListenToSessionMetadata listenLogic;
  final GetStaticSessionMetadata getterLogic;
  final GetSessionPresetInfo presetLogic;
  final GetInstructionType getInstructionTypeLogic;
  _SessionMetadataStoreBase({
    required this.listenLogic,
    required this.getInstructionTypeLogic,
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
  String presetName = '';

  @observable
  ObservableList tags = ObservableList.of([]);

  @observable
  ObservableList oddConfiguration = ObservableList.of([]);

  @observable
  ObservableList evenConfiguration = ObservableList.of([]);

  @observable
  SessionInstructionTypes instructionType = SessionInstructionTypes.initial;

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
  _getInstructionType(String unifiedUID) async {
    final res = await getInstructionTypeLogic(unifiedUID);
    res.fold(
      (failure) => baseErrorUpdater(failure),
      (instructionType) => this.instructionType = instructionType,
    );
  }

  @action
  _getStaticMetadata() async {
    final res = await getterLogic(NoParams());
    res.fold((failure) => baseMapFailureToMessage(failure), (entity) async {
      leaderIsWhitelisted = entity.leaderIsWhitelisted;
      isAPremiumSession = entity.isAPremiumSession;
      isAValidSession = entity.isAValidSession;
      userIndex = entity.userIndex;
      presetUID = entity.presetUID;
      if (presetName.isEmpty) {
        final res = await presetLogic(presetUID);
        res.fold((failure) => baseMapFailureToMessage(failure), (presetEntity) {
          presetName = presetEntity.name;
          tags = ObservableList.of(presetEntity.tags);
          oddConfiguration = ObservableList.of(presetEntity.oddConfiguration);
          evenConfiguration = ObservableList.of(presetEntity.evenConfiguration);
        });
      }
    });
    //
  }

  @action
  Future<void> get(NoParams params) async {
    final result = await listenLogic(params);
    result.fold(
      (failure) {
        errorMessage = baseMapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        streamSubscription = sessionMetadata.listen((value) async {
          if (value.phases.length != currentPhases.length) {
            await _getStaticMetadata();
            await _getInstructionType(presetUID);
          }
          everyoneIsOnline = value.everyoneIsOnline;
          final phases = value.phases.map((e) => double.parse(e.toString()));
          currentPhases = ObservableList.of(phases);
          sessionHasBegun = value.sessionHasBegun;
          userIsSpeaking = value.userIsSpeaking;
          userCanSpeak = value.userCanSpeak;
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
  PresetTypes get presetType {
    if (presetName.contains('sultat')) {
      return PresetTypes.consultative;
    } else if (presetName.contains('llaborat')) {
      return PresetTypes.collaborative;
    } else if (presetName.contains('crat')) {
      return PresetTypes.socratic;
    } else {
      return PresetTypes.none;
    }
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