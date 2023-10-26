// * 3rd Party Libs
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
// * Domain Imports
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
// * Core Imports
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
// * Data Source Imports
import 'package:nokhte/app/modules/authentication/data/sources/auth_remote_source.dart';

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
}
