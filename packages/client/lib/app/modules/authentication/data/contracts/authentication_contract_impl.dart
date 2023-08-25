/// authentication_contract_impl.dart
///  Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the implementation of the [AuthenticationContract] in the
/// data layer, [AuthenticationContractImpl]. The implementation interacts with
/// the [AuthenticationRemoteSource] and [NetworkInfo] to perform authentication
/// operations and handle network connectivity.
///
/// Note: The `_AppleOrGoogleChooser` typedef is used to define a function that
/// returns a `Future<dynamic>`, which is used in the `_signInWith` method to
/// choose between Google and Apple sign-in.

// * 3rd Party Libs
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
// * Domain Imports
import 'package:primala/app/modules/authentication/domain/domain.dart';
// * Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
// * Data Source Imports
import 'package:primala/app/modules/authentication/data/sources/auth_remote_source.dart';

/// [_AppleOrGoogleChooser] is a typedef for a function that returns a
/// [Future<dynamic>].
typedef _AppleOrGoogleChooser = Future<dynamic> Function();

/// [AuthenticationContractImpl] is the implementation of the
/// [AuthenticationContract] in the data layer.
class AuthenticationContractImpl implements AuthenticationContract {
  final AuthenticationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  /// Constructs an [AuthenticationContractImpl] instance with the provided
  /// [remoteSource] and [networkInfo].
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

  /// [_signInWith] is a private method that performs the shared sign-in logic
  /// with either Google or Apple based on the provided [_AppleOrGoogleChooser]
  /// function.
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
