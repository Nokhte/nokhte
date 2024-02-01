import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

abstract class PurposeSessionPresenceContract
    extends BasePresenceContract<CollaborationSessionMetadata> {
  Future<Either<Failure, bool>> updateTimerStatus(bool params);
}
