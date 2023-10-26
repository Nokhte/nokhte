import 'package:nokhte/app/modules/authentication/domain/domain.dart';
// * Primala Core Imports
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Miscc Libs
import 'package:dartz/dartz.dart';

class SignInWithGoogle
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final AuthenticationContract contract;

  SignInWithGoogle({required this.contract});

  @override
  Future<Either<Failure, AuthProviderEntity>> call(NoParams params) async {
    return await contract.googleSignIn();
  }
}
