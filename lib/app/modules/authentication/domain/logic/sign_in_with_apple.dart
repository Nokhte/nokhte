// * Primala Domain Imports
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
// * Primala Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// * Misc Libs
import 'package:dartz/dartz.dart';

class SignInWithApple
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final AuthenticationContract contract;

  SignInWithApple({required this.contract});

  @override
  Future<Either<Failure, AuthProviderEntity>> call(NoParams params) async {
    return await contract.appleSignIn();
  }
}
