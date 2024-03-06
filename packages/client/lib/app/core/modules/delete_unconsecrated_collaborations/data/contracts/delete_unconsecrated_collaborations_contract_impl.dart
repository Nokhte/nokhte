import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class DeleteUnconsecratedCollaborationsContractImpl
    with ResponseToStatus
    implements DeleteUnconsecratedCollaborationsContract {
  final DeleteUnconsecratedCollaborationsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  DeleteUnconsecratedCollaborationsContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  deleteIrlActiveNokhteSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteIrlActiveNokhteSession();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
