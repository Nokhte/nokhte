import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/individual_session/domain/domain.dart';

abstract class IndividualSessionContract {
  Future<Either<Failure, CollectivePurposeEntity>> fetchThePurpose(
      NoParams params);
}
