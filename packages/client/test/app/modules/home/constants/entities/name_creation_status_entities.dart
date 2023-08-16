import 'package:primala/app/modules/home/domain/entities/name_creation_status_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';

class ConstantNameCreationStatusEntities {
  static NameCreationStatusEntity get successCase =>
      const NameCreationStatusEntity(isSent: true);
  static NameCreationStatusEntity get notSuccessCase =>
      const NameCreationStatusEntity(isSent: false);
  static Either<Failure, NameCreationStatusEntity> get wrappedSuccessCase =>
      const Right(NameCreationStatusEntity(isSent: true));
  static Either<Failure, NameCreationStatusEntity> get wrappedNotSuccessCase =>
      const Right(NameCreationStatusEntity(isSent: false));
}
