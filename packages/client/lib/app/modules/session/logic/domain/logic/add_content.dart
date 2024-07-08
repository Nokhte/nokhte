import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/logic/domain/domain.dart';

class AddContent implements AbstractFutureLogic<bool, String> {
  final SessionPresenceContract contract;

  AddContent({required this.contract});

  @override
  call(params) async => await contract.addContent(params);
}
