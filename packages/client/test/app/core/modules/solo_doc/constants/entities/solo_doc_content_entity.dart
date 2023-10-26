import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

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
