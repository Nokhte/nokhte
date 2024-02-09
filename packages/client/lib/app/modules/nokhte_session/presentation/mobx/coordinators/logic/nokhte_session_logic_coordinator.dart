// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';
part 'nokhte_session_logic_coordinator.g.dart';

class NokhteSessionLogicCoordinator = _NokhteSessionLogicCoordinatorBase
    with _$NokhteSessionLogicCoordinator;

abstract class _NokhteSessionLogicCoordinatorBase extends BaseMobxDBStore
    with Store {
  final CheckIfUserHasTheQuestion checkIfUserHasTheQuestionLogic;
  final ChangeDesireToLeave changeDesireToLeaveLogic;
  final DeleteActiveNokhteSession deleteActiveSessionLogic;

  _NokhteSessionLogicCoordinatorBase({
    required this.checkIfUserHasTheQuestionLogic,
    required this.changeDesireToLeaveLogic,
    required this.deleteActiveSessionLogic,
  });

  @observable
  bool hasTheQuestion = false;

  @observable
  bool hasUpdatedDesireToLeave = false;

  @observable
  bool hasDeletedSession = false;

  @action
  checkIfUserHasTheQuestion() async {
    final res = await checkIfUserHasTheQuestionLogic(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (status) => hasTheQuestion = status);
  }

  @action
  changeDesireToLeave(ChangeDesireToLeaveParams params) async {
    final res = await changeDesireToLeaveLogic(params);
    res.fold((failure) => errorUpdater(failure),
        (status) => hasUpdatedDesireToLeave = status);
  }

  @action
  deleteTheSession() async {
    final res = await deleteActiveSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (status) => hasDeletedSession,
    );
  }

  @override
  List<Object> get props => [];
}
