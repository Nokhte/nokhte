// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
part 'active_monetization_session_coordinator.g.dart';

class ActiveMonetizationSessionCoordinator = _ActiveMonetizationSessionCoordinatorBase
    with _$ActiveMonetizationSessionCoordinator;


abstract class _ActiveMonetizationSessionCoordinatorBase
    with Store, BaseMobxLogic {
  final StartMonetizationSession startMonetizationSessionLogic;
  final UpdateHasFinishedExplanation updateHasFinishedExplanationLogic;
  final ListenToExplanationCompletionStatus
      listenToExplanationCompletionStatusLogic;
  final DisposeExplanationCompletionStatusStream disposeLogic;
  final DeleteActiveMonetizationSession deleteActiveMonetizationSessionLogic;

  _ActiveMonetizationSessionCoordinatorBase({
    required this.startMonetizationSessionLogic,
    required this.updateHasFinishedExplanationLogic,
    required this.listenToExplanationCompletionStatusLogic,
    required this.deleteActiveMonetizationSessionLogic,
    required this.disposeLogic,
  }) {
    initBaseLogicActions();
  }

  @observable
  bool everyoneHasFinishedExplanation = false;

  @observable
  bool sessionHasStarted = false;

  @observable
  bool hasUpdatedHasFinishedExplanation = false;

  @observable
  ObservableStream<bool> stream = ObservableStream(const Stream.empty());

  @action
  dispose() async {
    disposeLogic(NoParams());
    await stream.close();
  }

  @action
  delete() async {
    await deleteActiveMonetizationSessionLogic(NoParams());
  }

  @action
  startMonetizationSession() async {
    final result = await startMonetizationSessionLogic(NoParams());
    result.fold(
      (failure) {
        setErrorMessage(mapFailureToMessage(failure));
        setState(StoreState.initial);
      },
      (value) async => sessionHasStarted = value,
    );
  }

  @action
  updateHasFinishedExplanation() async {
    final result = await updateHasFinishedExplanationLogic(NoParams());
    result.fold(
      (failure) {
        setErrorMessage(mapFailureToMessage(failure));
        setState(StoreState.initial);
      },
      (value) async => hasUpdatedHasFinishedExplanation = value,
    );
  }

  @action
  listenToExplanationCompletionStatus() async {
    final result = await listenToExplanationCompletionStatusLogic(NoParams());
    result.fold(
      (failure) {
        setErrorMessage(mapFailureToMessage(failure));
        setState(StoreState.initial);
      },
      (stream) {
        this.stream = ObservableStream(stream);
        this.stream.listen(
              (value) => everyoneHasFinishedExplanation = value,
            );
      },
    );
  }
}
