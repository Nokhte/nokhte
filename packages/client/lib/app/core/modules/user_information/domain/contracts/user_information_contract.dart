import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

abstract class UserInformationContract extends BaseGetUserInfoContract {
  Future<Either<Failure, bool>> updatePreferredPreset(String presetUID);
  Future<Either<Failure, bool>> updateUserFlag(UserFlagParam newEntryStatus);
  Future<Either<Failure, PreferredPresetEntity>> getPreferredPreset(
    NoParams params,
  );
}
