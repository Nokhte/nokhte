import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/data/data.dart';
import 'package:primala/app/core/network/network_info.dart';

class GyroscopicContractImpl implements GyroscopicContract {
  final GyroscopicRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  GyroscopicContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, DirectionAngleModel>> getDirectionAngle(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getDirectionAngle();
      return Right(DirectionAngleModel(angleStream: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  ReferenceAngleSetterStatusModel setReferenceAngle(int newReferenceAngle) {
    remoteSource.setReferenceAngle(newReferenceAngle);
    return const ReferenceAngleSetterStatusModel(isSet: true);
  }
}
