import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/mixins/response_to_status.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';

class SoloDocContractImpl with ResponseToStatus implements SoloDocContract {
  final SoloDocRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SoloDocContractImpl({
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
      return Right(
        fromSupabaseProperty<String>(
            res, SoloSharableDocumentQueries.content, ""),
      );
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
