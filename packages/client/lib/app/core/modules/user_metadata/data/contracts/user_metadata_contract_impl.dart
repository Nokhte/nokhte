import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/user_metadata/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_metadata/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class UserMetadataContractImpl
    with ResponseToStatus
    implements UserMetadataContract {
  final UserMetadataRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  UserMetadataContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  addUserMetadata(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addUserMetadata();
      return fromFunctionResponse(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getUserMetadata(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getUserMetadata();
      return Right(UserMetadataEntity.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
