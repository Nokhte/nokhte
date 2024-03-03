// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/domain/domain.dart';
part 'legacy_virtual_nokhte_session_logic_coordinator.g.dart';

class LegacyVirtualNokhteSessionLogicCoordinator = _LegacyVirtualNokhteSessionLogicCoordinatorBase
    with _$LegacyVirtualNokhteSessionLogicCoordinator;

abstract class _LegacyVirtualNokhteSessionLogicCoordinatorBase
    extends BaseMobxDBStore with Store {
  final CheckIfUserHasTheQuestion checkIfUserHasTheQuestionLogic;
  final ChangeDesireToLeave changeDesireToLeaveLogic;

  _LegacyVirtualNokhteSessionLogicCoordinatorBase({
    required this.checkIfUserHasTheQuestionLogic,
    required this.changeDesireToLeaveLogic,
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

  @override
  List<Object> get props => [];
}
