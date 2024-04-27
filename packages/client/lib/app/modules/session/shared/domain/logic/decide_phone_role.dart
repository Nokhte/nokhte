import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/session.dart';

class DecidePhoneRole
    implements AbstractFutureLogic<SessionPhoneRole, NoParams> {
  final SharedSessionContract contract;

  DecidePhoneRole({required this.contract});

  @override
  call(params) async => await contract.decidePhonerole(params);
}
