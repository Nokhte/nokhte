import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/presets/domain/domain.dart';

abstract class PresetsContract {
  Future<Either<Failure, CompanyPresetsEntity>> getCompanyPresets(
    NoParams params,
  );
}
