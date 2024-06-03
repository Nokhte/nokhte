import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';

abstract class UserMetadataContract {
  Future<Either<Failure, bool>> addUserMetadata(NoParams params);
  Future<Either<Failure, UserMetadataEntity>> getUserMetadata(NoParams params);
}
