import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/entities/collaboration_activation_status_entity.dart';

abstract class UpdateExistingCollaborationsConstract {
  Future<Either<Failure, CollaborationConsecrationStatusEntity>>
      consecrateTheCollaboration(NoParams params);
  Future<Either<Failure, CollaborationActivationStatusEntity>>
      updateCollaborationActivationStatus({required bool shouldActivate});
}
