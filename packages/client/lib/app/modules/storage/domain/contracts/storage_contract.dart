import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';

abstract class StorageContract {
  Future<Either<Failure, List<NokhteSessionArtifactEntity>>>
      getNokhteSessionArtifacts(NoParams params);

  Future<Either<Failure, bool>> updateSessionAlias(
      UpdateSessionAliasParams params);
}
