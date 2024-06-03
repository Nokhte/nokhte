import 'package:nokhte/app/modules/login/login.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

class SignInWithGoogle
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final LoginContract contract;

  SignInWithGoogle({required this.contract});

  @override
  call(NoParams params) async => await contract.googleSignIn(params);
}
