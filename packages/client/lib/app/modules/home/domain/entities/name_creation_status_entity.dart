import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';
import 'package:nokhte/app/core/error/failure.dart';

class NameCreationStatusEntity extends BaseSingleBooleanEntity {
  // ignore: use_super_parameters
  const NameCreationStatusEntity({required isSent}) : super(isTrue: isSent);

  static Either<Failure, NameCreationStatusEntity> get initial =>
      const Right(NameCreationStatusEntity(isSent: false));
}
