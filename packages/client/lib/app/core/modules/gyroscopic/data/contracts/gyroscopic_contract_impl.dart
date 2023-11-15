import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

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

  @override
  ReferenceAngleSetterStatusEntity resetRefAngle(ResetRefAngleParams params) {
    remoteSource.resetRefAngleForMaxCapacity(
        maxAngle: params.desiredSetAngle, currentValue: params.currentValue);
    return const ReferenceAngleSetterStatusModel(isSet: true);
  }
}
