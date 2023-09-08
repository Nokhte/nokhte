import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

class ConstantSoloDocSubmissionStatusModel {
  static SoloDocSubmissionStatusModel get successCase =>
      const SoloDocSubmissionStatusModel(isSubmitted: true);
  static SoloDocSubmissionStatusModel get notSuccessCase =>
      const SoloDocSubmissionStatusModel(isSubmitted: false);
  static Either<Failure, SoloDocSubmissionStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocSubmissionStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
