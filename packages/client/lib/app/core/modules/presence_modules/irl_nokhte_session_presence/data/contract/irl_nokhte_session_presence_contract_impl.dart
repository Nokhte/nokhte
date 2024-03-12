// ignore_for_file: overridden_fields, annotate_overrides

import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';

class IrlNokhteSessionPresenceContractImpl
    extends BasePresenceContractImpl<IrlNokhteSessionMetadata>
    with ResponseToStatus
    implements IrlNokhteSessionPresenceContract {
  final IrlNokhteSessionPresenceRemoteSource remoteSource;
  IrlNokhteSessionPresenceContractImpl({
    required this.remoteSource,
    required super.networkInfo,
  }) : super(remoteSource: remoteSource);

  @override
  Future<Either<Failure, bool>> addContent(String params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addContent(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> completeTheSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.completeTheSession();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
