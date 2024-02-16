import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/user_information/shared/base_get_user_info_contract.dart';

abstract class UserInformationContract extends BaseGetUserInfoContract {
  Future<Either<Failure, bool>> updateHasSentAnInvitation(
      bool hasSentAnInvitationParam);
  Future<Either<Failure, bool>> updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam);
  Future<Either<Failure, bool>> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlowParam);
}
