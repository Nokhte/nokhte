import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/domain/domain.dart';

class UpdateHasGyroscope implements AbstractFutureLogic<bool, bool> {
  final SessionPresenceContract contract;

  UpdateHasGyroscope({required this.contract});

  @override
  call(params) async => await contract.updateHasGyroscope(params);
}
