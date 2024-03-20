import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/domain/domain.dart';

class UpdateHasGyroscope implements AbstractFutureLogic<bool, bool> {
  final IrlNokhteSessionPresenceContract contract;

  UpdateHasGyroscope({required this.contract});

  @override
  call(params) async => await contract.updateHasGyroscope(params);
}
