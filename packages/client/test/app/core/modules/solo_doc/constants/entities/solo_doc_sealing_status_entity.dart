import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

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
