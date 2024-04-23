import 'package:nokhte/app/modules/login/domain/domain.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

class GetLoginState extends AbstractSyncNoFailureLogic<Stream<bool>, NoParams> {
  final LoginContract contract;

  GetLoginState({required this.contract});

  @override
  call(NoParams params) => contract.getAuthState(params);
}
