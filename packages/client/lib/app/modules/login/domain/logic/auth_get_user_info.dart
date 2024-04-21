import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/entities/user_journey_info_entity.dart';
import 'package:nokhte/app/core/modules/user_information/shared/base_get_user_info.dart';
import 'package:nokhte/app/modules/login/domain/contracts/login_contract.dart';

class AuthGetUserInfo extends BaseGetUserInfo<LoginContract> {
  AuthGetUserInfo({required super.contract});

  @override
  Future<Either<Failure, UserJourneyInfoEntity>> call(NoParams params) async =>
      await contract.getUserInfo(params);
}
