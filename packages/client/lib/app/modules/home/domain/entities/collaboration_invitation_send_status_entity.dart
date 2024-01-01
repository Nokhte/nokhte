import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/entities/default_db_status_entity.dart';
import 'package:nokhte/app/core/error/failure.dart';

class CollaborationInvitationSendStatusEntity extends DefaultDBStatusEntity {
  const CollaborationInvitationSendStatusEntity({
    required super.isSent,
  });

  static Either<Failure, CollaborationInvitationSendStatusEntity> get initial =>
      const Right(
        CollaborationInvitationSendStatusEntity(
          isSent: false,
        ),
      );
}
