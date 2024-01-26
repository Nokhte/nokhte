import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';

abstract class GetThePurposeContract {
  Future<Either<Failure, CollectivePurposeEntity>> getThePurpose(
      NoParams params);
}
