import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/entities/default_db_status_entity.dart';
import 'package:nokhte/app/core/error/failure.dart';

class DeepLinkSendStatusEntity extends DefaultDBStatusEntity {
  const DeepLinkSendStatusEntity({
    required super.isSent,
  });

  static Either<Failure, DeepLinkSendStatusEntity> get initial =>
      const Right(DeepLinkSendStatusEntity(isSent: false));
}
