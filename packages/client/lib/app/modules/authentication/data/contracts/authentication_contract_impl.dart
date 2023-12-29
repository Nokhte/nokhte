import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
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
  AuthStateEntity getAuthState() => remoteSource.getAuthState();
}
