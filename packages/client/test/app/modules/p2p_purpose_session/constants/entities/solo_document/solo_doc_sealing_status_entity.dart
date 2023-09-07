import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class ConstantSoloDocSealingStatusEntity {
  static SoloDocSealingStatusEntity get successCase =>
      const SoloDocSealingStatusEntity(isSealed: true);
  static SoloDocSealingStatusEntity get notSuccessCase =>
      const SoloDocSealingStatusEntity(isSealed: false);
  static Either<Failure, SoloDocSealingStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocSealingStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
