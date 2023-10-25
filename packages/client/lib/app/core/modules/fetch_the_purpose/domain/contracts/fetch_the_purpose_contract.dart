import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/fetch_the_purpose/domain/domain.dart';

abstract class FetchThePurposeContract {
  Future<Either<Failure, CollectivePurposeEntity>> fetchThePurpose(
      NoParams params);
}
