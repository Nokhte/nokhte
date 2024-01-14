import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';
import 'package:nokhte/app/core/error/failure.dart';

class DeepLinkSendStatusEntity extends BaseSingleBooleanEntity {
  const DeepLinkSendStatusEntity({
    required super.isTrue,
  });

  static Either<Failure, DeepLinkSendStatusEntity> get initial =>
      const Right(DeepLinkSendStatusEntity(isTrue: false));
}
