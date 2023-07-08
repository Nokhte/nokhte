// * 3rd Party Libs
import 'package:dartz/dartz.dart';
import 'dart:io';
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

typedef _AppleOrGoogleChooser = Future<dynamic> Function();

class AuthenticationContractImpl implements AuthenticationContract {
  final AuthenticationRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  AuthenticationContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthProviderEntity>> googleSignIn() async {
    return await _signInWith(() => remoteSource.signInWithGoogle());
  }

  @override
  Future<Either<Failure, AuthProviderEntity>> appleSignIn() async {
    if (Platform.isAndroid == true) {
      return const Left(
        AuthenticationFailure(
          message: "Not Available on Android",
          failureCode: "NOT_AVAILABLE_ON_ANDROID_ERROR",
        ),
      );
    } else {
      return await _signInWith(() => remoteSource.signInWithApple());
    }
  }

  Future<Either<Failure, AuthProviderEntity>> _signInWith(
      _AppleOrGoogleChooser getOAuthProvider) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAuth = await getOAuthProvider();
        return Right(remoteAuth);
      } catch (err) {
        return const Left(
          AuthenticationFailure(
            message: "Authentication Error",
            failureCode: 'AUTHENTICATION_ERROR',
          ),
        );
      }
    } else {
      return const Left(
        NetworkConnectionFailure(
          message: "Internet Connection Error",
          failureCode: 'INTERNET_CONNECTION_ERROR',
        ),
      );
    }
  }

  @override
  AuthEntity getAuthState() {
    final authState = remoteSource.getAuthState();
    return authState;
  }
}
