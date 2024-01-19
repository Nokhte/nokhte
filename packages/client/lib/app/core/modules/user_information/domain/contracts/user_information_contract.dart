import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

abstract class UserInformationContract {
  Future<Either<Failure, UserJourneyInfoEntity>> getUserInfo(NoParams params);
  Future<Either<Failure, bool>> updateHasSentAnInvitation(
      bool hasSentAnInvitationParam);
  Future<Either<Failure, bool>> updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam);
  Future<Either<Failure, bool>> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlowParam);
}
