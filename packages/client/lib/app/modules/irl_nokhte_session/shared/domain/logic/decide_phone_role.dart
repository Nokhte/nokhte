import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';

class DecidePhoneRole
    implements AbstractFutureLogic<IrlNokhteSessionPhoneRole, NoParams> {
  final SharedIrlNokhteSessionContract contract;

  DecidePhoneRole({required this.contract});

  @override
  call(params) async => await contract.decidePhonerole(params);
}
