// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
part 'get_session_metadata_store.g.dart';

class GetSessionMetadataStore = _GetSessionMetadataStoreBase
    with _$GetSessionMetadataStore;

abstract class _GetSessionMetadataStoreBase
    extends BaseMobxDBStore<NoParams, Stream<NokhteSessionMetadata>>
    with Store {
  final GetSessionMetadata logic;
  _GetSessionMetadataStoreBase({required this.logic});

  @observable
  bool userHasGyroscope = true;

  @observable
  bool collaboratorHasGyroscope = true;

  @observable
  int userIndex = -1;

  @observable
  bool everyoneIsOnline = false;

  @observable
  bool everyoneHasGyroscopes = false;

  @observable
  bool userIsSpeaking = false;

  @observable
  bool userCanSpeak = false;

  @observable
  ObservableList<double> currentPhases = ObservableList.of([]);

  @observable
  bool someoneElseIsTalking = false;

  @observable
  bool isAPremiumSession = false;

  @observable
  bool sessionHasBegun = false;

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
    final result = await logic(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        streamSubscription = sessionMetadata.listen((value) {
          isAPremiumSession = value.isAPremiumSession;
          userIndex = value.userIndex;
          everyoneHasGyroscopes = value.everyoneHasGyroscopes;
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
  bool get shouldAdjustToFallbackExitProtocol =>
      !userHasGyroscope || !collaboratorHasGyroscope;

  @computed
  bool get canMoveIntoInstructions => currentPhases.every((e) => e == 1);

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
  bool get canMoveIntoSecondInstructionsSet {
    if (numberOfCollaborators.isOdd) {
      return evenListMinusHybridPhone.every((e) => e == 2) &&
          oddList.every((e) => e == 1);
    } else {
      return evenList.every((e) => e == 2) && oddList.every((e) => e == 1);
    }
  }

  @computed
  int get numberOfCollaborators => currentPhases.length;
}
