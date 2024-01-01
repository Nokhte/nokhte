import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/entities/default_db_status_entity.dart';
import 'package:nokhte/app/core/error/failure.dart';

class NameCreationStatusEntity extends DefaultDBStatusEntity {
  // ignore: use_super_parameters
  const NameCreationStatusEntity({required isSent}) : super(isSent: isSent);

  static Either<Failure, NameCreationStatusEntity> get initial =>
      const Right(NameCreationStatusEntity(isSent: false));
}
