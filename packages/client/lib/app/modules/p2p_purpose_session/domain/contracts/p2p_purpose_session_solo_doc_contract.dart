import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

abstract class P2PPurposeSessionSoloDocContract {
  Future<Either<Failure, SoloDocContentEntity>> getSoloDocContent();
  Future<Either<Failure, SoloDocSubmissionStatusEntity>> submitDocContent({
    required String newContent,
  });
  Future<Either<Failure, SoloDocCreationStatusEntity>> createSoloDoc();
  Future<Either<Failure, SoloDocSealingStatusEntity>> sealSoloDoc();
  Future<Either<Failure, SoloDocSharingStatusEntity>> shareSoloDoc();
}
