import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

abstract class CollaborationContract {
  Future<Either<Failure, CollaborationInvitationSendStatusEntity>>
      shareCollaborationInvitation(String link);
  Future<Either<Failure, CollaborationInvitationDataEntity>> getInvitationURL(
      NoParams params);
}
