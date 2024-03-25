import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/domain/domain.dart';

class AddContent implements AbstractFutureLogic<bool, String> {
  final IrlNokhteSessionPresenceContract contract;

  AddContent({required this.contract});

  @override
  call(params) async => await contract.addContent(params);
}
