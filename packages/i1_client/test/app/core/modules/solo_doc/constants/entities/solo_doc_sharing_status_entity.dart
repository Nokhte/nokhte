import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class ConstantSoloDocSharingStatusEntity {
  static SoloDocSharingStatusEntity get successCase =>
      const SoloDocSharingStatusEntity(isShared: true);
  static SoloDocSharingStatusEntity get notSuccessCase =>
      const SoloDocSharingStatusEntity(isShared: false);
  static Either<Failure, SoloDocSharingStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocSharingStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
