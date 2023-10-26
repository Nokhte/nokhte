import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';

class ConstantSoloDocCreationStatusModel {
  static SoloDocCreationStatusModel get successCase =>
      const SoloDocCreationStatusModel(isCreated: true);
  static SoloDocCreationStatusModel get notSuccessCase =>
      const SoloDocCreationStatusModel(isCreated: false);
  static Either<Failure, SoloDocCreationStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocCreationStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
