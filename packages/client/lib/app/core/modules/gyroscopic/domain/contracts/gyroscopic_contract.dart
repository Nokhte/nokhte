import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

abstract class GyroscopicContract {
  Future<Either<Failure, GyroscopeDirectionsEntity>> fetchRawDirections(
    FetchRawDirectionsParams params,
  );
}
