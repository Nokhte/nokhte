import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/authentication/data/models/name_creation_status_model.dart';

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
