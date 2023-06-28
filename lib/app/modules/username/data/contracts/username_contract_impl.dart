import 'package:dartz/dartz.dart';
import 'package:primala/app/modules/username/data/models/default_username_model.dart';
import 'package:primala/app/modules/username/data/models/username_status_model.dart';
// * Primala Entities
import 'package:primala/app/modules/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
// * Primala Contracts
import 'package:primala/app/modules/username/domain/contracts/username_contract.dart';
// * Primala Sources
import 'package:primala/app/modules/username/data/sources/username_remote_source.dart';
// * Primala Core
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
// * failure constants
import 'package:primala/app/core/constants/failure_constants.dart';

class UsernameContractImpl implements UsernameContract {
  /// * implement the remove source
  final UsernameRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  UsernameContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UsernameStatusEntity>> createUsername(
      String username) async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes = await remoteSource.createUsername(username);
      return Right(
        UsernameStatusModel.fromSupabase(remoteSourceRes),
      );
    } else {
      return Left(
        FailureConstants.internetConnectionFailure,
      );
    }
  }

  @override
  Future<Either<Failure, DefaultUsernameEntity>> getDefaultUsername() async {
    final remoteSourceRes = await remoteSource.getDefaultUsername();
    return Right(
      DefaultUsernameModel.fromSupabase(remoteSourceRes),
    );
  }

  @override
  Future<Either<Failure, UsernameStatusEntity>>
      checkIfUsernameIsCreated() async {
    if (await networkInfo.isConnected) {
      final remoteSourceRes = await remoteSource.checkIfUsernameIsCreated();
      return Right(
        UsernameStatusModel.fromSupabase(remoteSourceRes),
      );
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
