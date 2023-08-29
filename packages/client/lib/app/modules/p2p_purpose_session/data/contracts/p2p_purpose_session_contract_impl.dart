import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class P2PPurposeSessionContractImpl implements P2PPurposeSessionContract {
  final P2PPurposeSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;
  P2PPurposeSessionContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AgoraCallTokenModel>> fetchAgoraToken({
    required String channelName,
  }) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.fetchAgoraToken(channelName: channelName);
      return Right(AgoraCallTokenModel.fromTokenServer(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
