import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class NormalizeYaw
    implements
        AbstractFutureLogic<NormalizedYawEntity, FetchRawDirectionsParams> {
  final GyroscopicContract contract;

  NormalizeYaw({required this.contract});

  @override
  call(params) async {
    final res = await contract.fetchRawDirections(params);
    return res.fold((failure) {
      return Left(failure);
    }, (entity) {
      double yaw = params.gyroData * params.dt * (180.0 / pi);
      // Normalize the yaw angle to keep it within the range of 0 to 360 degrees
      if (yaw < 0) {
        yaw += 360.0;
      } else if (entity.yaw >= 360.0) {
        yaw -= 360.0;
      }
      print("WHAT IS THIS YAW????? $yaw");
      // Return the normalized yaw angle
      return Right(NormalizedYawEntity(yaw: yaw));
    });
  }
}

class FetchRawDirectionsParams extends Equatable {
  final double gyroData;
  final double accelerometerPitch;
  final double accelerometerRoll;
  final double dt;

  const FetchRawDirectionsParams({
    required this.gyroData,
    required this.accelerometerPitch,
    required this.accelerometerRoll,
    required this.dt,
  });

  @override
  List<Object> get props => [
        gyroData,
        accelerometerPitch,
        accelerometerRoll,
        dt,
      ];
}
