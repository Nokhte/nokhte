import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
