import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/domain/domain.dart';

abstract class FetchThePurposeContract {
  Future<Either<Failure, CollectivePurposeEntity>> fetchThePurpose(
      NoParams params);
}
