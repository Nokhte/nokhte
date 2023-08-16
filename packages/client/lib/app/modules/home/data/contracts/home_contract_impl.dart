// * 3rd Party Libs
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/home/data/models/name_creation_status_model.dart';
import 'package:primala/app/modules/home/data/sources/home_remote_source.dart';
// * Domain Imports
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart';
// * Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
// * Data Source Imports
import 'package:primala/app/modules/home/domain/entities/name_creation_status_entity.dart';

class HomeContractImpl implements HomeContract {
  final HomeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  HomeContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase() async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.addNamesToDatabase();
      return Right(NameCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
