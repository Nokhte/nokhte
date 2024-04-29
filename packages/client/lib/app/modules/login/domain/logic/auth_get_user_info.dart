import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/login/login.dart';

class AuthGetUserInfo extends BaseGetUserInfo<LoginContract> {
  AuthGetUserInfo({required super.contract});

  @override
  Future<Either<Failure, UserJourneyInfoEntity>> call(NoParams params) async =>
      await contract.getUserInfo(params);
}
