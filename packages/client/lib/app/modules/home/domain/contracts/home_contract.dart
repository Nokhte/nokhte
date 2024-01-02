import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';

abstract class HomeContract {
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase(
      NoParams params);
  Future<Either<Failure, CollaboratorPhraseEntity>> getCollaboratorPhrase(
      NoParams params);
  Future<Either<Failure, ExistingCollaborationsInfoEntity>>
      getExistingCollaborationInfo(NoParams params);
  Future<Either<Failure, CollaborationInvitationSendStatusEntity>>
      shareCollaborationInvitation(String link);
  Future<Either<Failure, CollaborationInvitationDataEntity>> getInvitationURL(
      NoParams params);
}
