// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';
part 'get_session_metadata_store.g.dart';

class GetSessionMetadataStore = _GetSessionMetadataStoreBase
    with _$GetSessionMetadataStore;

abstract class _GetSessionMetadataStoreBase
    extends BaseMobxDBStore<NoParams, Stream<IrlNokhteSessionMetadata>>
    with Store {
  final GetSessionMetadata logic;
  _GetSessionMetadataStoreBase({required this.logic});

  @observable
  bool userHasGyroscope = true;

  @observable
  bool collaboratorHasGyroscope = true;

  @observable
  double currentPhase = 0;

  @action
  setCurrentPhase(double newDouble) => currentPhase = newDouble;

  @observable
  double userPhase = 0;

  @observable
  double collaboratorPhase = 0.0;

  @observable
  bool userIsOnline = false;

  @observable
  bool userIsTalking = false;

  @observable
  bool collaboratorIsOnline = false;

  @observable
  bool collaboratorIsTalking = false;

  @observable
  bool sessionHasBegun = false;

  @observable
  ObservableStream<IrlNokhteSessionMetadata> sessionMetadata =
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
          userIsOnline = value.userIsOnline;
          collaboratorIsOnline = value.collaboratorIsOnline;
          userPhase = value.userPhase;
          collaboratorPhase = value.collaboratorPhase;
          userHasGyroscope = value.userHasGyroscope;
          collaboratorHasGyroscope = value.collaboratorHasGyroscope;
          sessionHasBegun = value.sessionHasBegun;
        });
        state = StoreState.loaded;
      },
    );
  }

  @computed
  bool get shouldAdjustToFallbackExitProtocol =>
      !userHasGyroscope || !collaboratorHasGyroscope;

  @computed
  bool get canMoveIntoInstructions => userPhase == 1 && collaboratorPhase == 1;

  @computed
  bool get canMoveIntoSession => userPhase == 2 && collaboratorPhase == 2;

  @computed
  bool get canExitTheSession => userPhase == 3 && collaboratorPhase == 3;

  @computed
  bool get canReturnHome => userPhase == 5 && collaboratorPhase == 5;

  @computed
  bool get canMoveIntoSecondInstructionsSet =>
      userPhase == 1 && collaboratorPhase == 2;
}
