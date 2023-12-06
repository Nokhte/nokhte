import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';

abstract class GetCurrentPerspectivesContract {
  Future<Either<Failure, CurrentPerspectivesEntity>> getCurrentPerspectives(
    NoParams params,
  );
}
