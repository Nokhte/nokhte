import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/home/data/models/name_creation_status_model.dart';

class ConstantNameCreationStatusModels {
  static NameCreationStatusModel get successCase =>
      const NameCreationStatusModel(isSent: true);
  static NameCreationStatusModel get notSuccessCase =>
      const NameCreationStatusModel(isSent: false);
  static Either<Failure, NameCreationStatusModel> get wrappedSuccessCase =>
      const Right(NameCreationStatusModel(isSent: true));
  static Either<Failure, NameCreationStatusModel> get wrappedNotSuccessCase =>
      const Right(NameCreationStatusModel(isSent: false));
}
