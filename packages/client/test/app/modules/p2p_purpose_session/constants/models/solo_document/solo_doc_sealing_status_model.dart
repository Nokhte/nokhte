import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';

class ConstantSoloDocSealingStatusModel {
  static SoloDocSealingStatusModel get successCase =>
      const SoloDocSealingStatusModel(isSealed: true);
  static SoloDocSealingStatusModel get notSuccessCase =>
      const SoloDocSealingStatusModel(isSealed: false);
  static Either<Failure, SoloDocSealingStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocSealingStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
