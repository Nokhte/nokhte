import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class ConstantSoloDocCreationStatusEntity {
  static SoloDocCreationStatusEntity get successCase =>
      const SoloDocCreationStatusEntity(isCreated: true);
  static SoloDocCreationStatusEntity get notSuccessCase =>
      const SoloDocCreationStatusEntity(isCreated: false);
  static Either<Failure, SoloDocCreationStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocCreationStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
