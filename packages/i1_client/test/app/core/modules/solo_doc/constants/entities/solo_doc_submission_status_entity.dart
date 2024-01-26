import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class ConstantSoloDocSubmissionStatusEntity {
  static SoloDocSubmissionStatusEntity get successCase =>
      const SoloDocSubmissionStatusEntity(isSubmitted: true);
  static SoloDocSubmissionStatusEntity get notSuccessCase =>
      const SoloDocSubmissionStatusEntity(isSubmitted: false);
  static Either<Failure, SoloDocSubmissionStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, SoloDocSubmissionStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
