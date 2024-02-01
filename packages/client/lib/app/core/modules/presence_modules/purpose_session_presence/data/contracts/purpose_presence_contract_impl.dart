// ignore_for_file: overridden_fields, annotate_overrides
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class PurposeSessionPresenceContractImpl
    extends BasePresenceContractImpl<CollaborationSessionMetadata>
    with ResponseToStatus
    implements PurposeSessionPresenceContract {
  final PurposeSessionPresenceRemoteSource remoteSource;

  PurposeSessionPresenceContractImpl({
    required this.remoteSource,
    required super.networkInfo,
  }) : super(remoteSource: remoteSource);

  @override
  updateTimerStatus(bool params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateTimerStatus(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
