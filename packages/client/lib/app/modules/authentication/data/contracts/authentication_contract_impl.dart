// * 3rd Party Libs
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/authentication/data/models/name_creation_status_model.dart';
// * Domain Imports
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
// * Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
// import 'package:primala/app/core/error/exceptions.dart';
// * Data Source Imports
import 'package:primala/app/modules/authentication/data/sources/auth_remote_source.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';

typedef _AppleOrGoogleChooser = Future<dynamic> Function();

class AuthenticationContractImpl implements AuthenticationContract {
  final AuthenticationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  AuthenticationContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthProviderEntity>> googleSignIn() async =>
      await _signInWith(() => remoteSource.signInWithGoogle());

  @override
  Future<Either<Failure, AuthProviderEntity>> appleSignIn() async =>
      await _signInWith(() => remoteSource.signInWithApple());

  Future<Either<Failure, AuthProviderEntity>> _signInWith(
      _AppleOrGoogleChooser getOAuthProvider) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAuth = await getOAuthProvider();
        return Right(remoteAuth);
      } catch (err) {
        return Left(FailureConstants.authFailure);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  AuthStateEntity getAuthState() {
    final authState = remoteSource.getAuthState();
    return authState;
  }

  @override
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addNamesToDatabase();
      return Right(NameCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
