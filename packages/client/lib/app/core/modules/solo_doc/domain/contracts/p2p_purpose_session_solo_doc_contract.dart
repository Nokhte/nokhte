import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

abstract class SoloDocContract {
  Future<Either<Failure, SoloDocContentEntity>> getSoloDocContent({
    required bool getCollaboratorsDoc,
  });
  Future<Either<Failure, SoloDocSubmissionStatusEntity>> submitDocContent({
    required String newContent,
  });
  Future<Either<Failure, SoloDocCreationStatusEntity>> createSoloDoc(
      {required String docType});
  Future<Either<Failure, SoloDocSealingStatusEntity>> sealSoloDoc();
  Future<Either<Failure, SoloDocSharingStatusEntity>> shareSoloDoc();
}
