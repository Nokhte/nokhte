import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/solo_docs/data/data.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

class SoloDocsContractImpl with ResponseToStatus implements SoloDocsContract {
  final SoloDocsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SoloDocsContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  createSoloDoc(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createSoloDoc(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getSoloDocContent(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getSoloDocContent(params);
      return Right(fromSupabaseProperty<String>(res, "content", ""));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  sealSoloDoc() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.sealSoloDoc();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  shareSoloDoc() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.shareSoloDoc();
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  submitDocContent(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.submitDocContent(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
