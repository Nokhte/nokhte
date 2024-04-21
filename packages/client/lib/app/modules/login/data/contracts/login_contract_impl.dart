import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/modules/login/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/login/data/sources/login_remote_source.dart';

typedef _AppleOrGoogleChooser = Future<dynamic> Function();

class LoginContractImpl with ResponseToStatus implements LoginContract {
  final LoginRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  LoginContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  googleSignIn(params) async =>
      await _signInWith(() => remoteSource.signInWithGoogle());

  @override
  appleSignIn(params) async =>
      await _signInWith(() => remoteSource.signInWithApple());

  _signInWith(_AppleOrGoogleChooser getOAuthProvider) async {
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
  getAuthState(params) => remoteSource.getAuthState();

  @override
  addName(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addName();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getUserInfo(params) async {
    if (await networkInfo.isConnected) {
      final userNamesRes = await remoteSource.getUserInfo();
      final nokhteSessionsRes = await remoteSource.getFinishedNokhteSessions();
      return Right(
        UserJourneyInfoModel.fromSupabase(
          userNamesRes: userNamesRes,
          finishedNokhteSessionsRes: nokhteSessionsRes,
        ),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}