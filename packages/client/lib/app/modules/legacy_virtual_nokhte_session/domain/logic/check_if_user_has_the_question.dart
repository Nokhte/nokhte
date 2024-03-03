import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/domain/domain.dart';

class CheckIfUserHasTheQuestion implements AbstractFutureLogic<bool, NoParams> {
  final LegacyVirtualNokhteSessionContract contract;
  CheckIfUserHasTheQuestion({required this.contract});

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion(params);
}
