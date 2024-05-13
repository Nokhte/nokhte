import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/login/domain/domain.dart';

class AddMetadata implements AbstractFutureLogic<bool, NoParams> {
  final LoginContract contract;

  AddMetadata({required this.contract});

  @override
  call(params) async => await contract.addMetadata(params);
}
