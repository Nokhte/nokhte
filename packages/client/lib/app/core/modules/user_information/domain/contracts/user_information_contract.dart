import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

abstract class UserInformationContract {
  Future<Either<Failure, UserJourneyInfoEntity>> getUserInfo(NoParams params);
  Future<Either<Failure, HasSentAnInvitationUpdateStatusEntity>>
      updateHasSentAnInvitation(bool hasSentAnInvitationParam);
  Future<Either<Failure, HasGoneThroughInvitationFlowUpdateStatusEntity>>
      updateHasGoneThroughInvitationFlow(
          bool hasGoneThroughInvitationFlowParam);
  Future<Either<Failure, WantsToRepeatInvitationFlowUpdateStatusEntity>>
      updateWantsToRepeatInvitationFlow(bool wantsToRepeatInvitationFlowParam);
}
