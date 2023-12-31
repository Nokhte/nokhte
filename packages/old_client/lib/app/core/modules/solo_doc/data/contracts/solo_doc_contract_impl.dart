import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class SoloDocContractImpl implements SoloDocContract {
  final SoloDocRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SoloDocContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SoloDocCreationStatusModel>> createSoloDoc(
      {required String docType}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createSoloDoc(docType: docType);
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
