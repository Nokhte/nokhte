import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';

abstract class IrlNokhteSessionPresenceContract
    extends BasePresenceContract<IrlNokhteSessionMetadata> {
  Future<Either<Failure, bool>> addContent(String params);
  Future<Either<Failure, bool>> completeTheSession(NoParams params);
}
