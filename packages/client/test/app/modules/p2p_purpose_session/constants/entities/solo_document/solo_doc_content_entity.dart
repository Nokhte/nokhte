import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class ConstantSoloDocContentEntity {
  static SoloDocContentEntity get successCase =>
      const SoloDocContentEntity(content: "content");
  static SoloDocContentEntity get notSuccessCase =>
      const SoloDocContentEntity(content: "");
  static Either<Failure, SoloDocContentEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocContentEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
