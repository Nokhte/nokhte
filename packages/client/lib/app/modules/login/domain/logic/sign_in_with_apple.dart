import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/modules/login/login.dart';

class SignInWithApple
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final LoginContract contract;

  SignInWithApple({required this.contract});

  @override
  Future<Either<Failure, AuthProviderEntity>> call(NoParams params) async {
    return await contract.appleSignIn(params);
  }
}
