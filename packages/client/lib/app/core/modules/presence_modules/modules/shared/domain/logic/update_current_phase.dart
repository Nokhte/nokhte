import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';

class UpdateCurrentPhase implements AbstractFutureLogic<bool, double> {
  final BasePresenceContract contract;

  UpdateCurrentPhase({required this.contract});

  @override
  call(params) async => await contract.updateCurrentPhase(params);
}
