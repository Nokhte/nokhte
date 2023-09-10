import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class P2PPurposeSessionSoloDocContractImpl
    implements P2PPurposeSessionSoloDocContract {
  final P2PPurposeSessionSoloDocRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  P2PPurposeSessionSoloDocContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SoloDocCreationStatusModel>> createSoloDoc() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createSoloDoc();
      return Right(SoloDocCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, SoloDocContentModel>> getSoloDocContent(
      {required bool getCollaboratorsDoc}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getSoloDocContent(
          getCollaboratorsDoc: getCollaboratorsDoc);
      return Right(SoloDocContentModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, SoloDocSealingStatusModel>> sealSoloDoc() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.sealSoloDoc();
      return Right(SoloDocSealingStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, SoloDocSharingStatusModel>> shareSoloDoc() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.shareSoloDoc();
      return Right(SoloDocSharingStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, SoloDocSubmissionStatusModel>> submitDocContent({
    required String newContent,
  }) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.submitDocContent(newContent: newContent);
      return Right(SoloDocSubmissionStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
