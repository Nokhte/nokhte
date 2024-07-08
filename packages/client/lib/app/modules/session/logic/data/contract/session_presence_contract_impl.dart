// ignore_for_file: overridden_fields

import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionPresenceContractImpl
    with ResponseToStatus, FromFinishedSessions
    implements SessionPresenceContract {
  final SessionPresenceRemoteSource remoteSource;
  final NetworkInfo networkInfo;
  SessionPresenceContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> addContent(String params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addContent(params);
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> completeTheSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.completeTheSession();
      return fromFunctionResponse(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  listenToRTSessionMetadata(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.listenToSessionMetadata();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateCurrentPhase(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateCurrentPhase(params);
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateOnlineStatus(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateOnlineStatus(params);
      return fromSupabase(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateWhoIsTalking(params) async {
    if (await networkInfo.isConnected) {
      switch (params) {
        case UpdateWhoIsTalkingParams.setUserAsTalker:
          final res = await remoteSource.setUserAsCurrentTalker();
          return fromSupabase(res);
        case UpdateWhoIsTalkingParams.clearOut:
          await remoteSource.clearTheCurrentTalker();
          return const Right(true);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  cancelSessionMetadataStream(NoParams params) =>
      remoteSource.cancelSessionMetadataStream();

  @override
  startTheSession(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.startTheSession();
      return fromFunctionResponse(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getSTSessionMetadata(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getStaticSessionMetadata();
      final uid = remoteSource.getUserUID();
      return Right(StaticSessionMetadataModel.fromSupabase(res, uid));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getSessionPresetInfo(unifiedUID) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getPresetInformation(unifiedUID);
      return Right(SessionPresetInfoModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getInstructionType(params) async {
    if (await networkInfo.isConnected) {
      final otherSessionsRes =
          await remoteSource.checkIfHasDoneSessionBesides(params);
      final currentPresetSessionsRes =
          await remoteSource.checkIfHasDoneSessionSessionType(params);
      return Right(toInstructionType(
        otherSessions: otherSessionsRes,
        currentPresetSessions: currentPresetSessionsRes,
      ));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
