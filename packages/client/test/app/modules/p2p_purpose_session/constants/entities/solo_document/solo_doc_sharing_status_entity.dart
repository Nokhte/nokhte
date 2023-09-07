import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
