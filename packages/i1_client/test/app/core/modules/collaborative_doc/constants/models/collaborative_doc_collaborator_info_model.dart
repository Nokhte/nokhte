import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

class ConstantCollaborativeDocCollaboratorInfoModel {
  static CollaborativeDocCollaboratorInfoModel get successCase =>
      CollaborativeDocCollaboratorInfoModel(
        collaboratorDocInfo: Stream.value(
          CollaboratorDocInfo(
            isPresent: true,
            delta: 2,
          ),
        ),
      );
  static CollaborativeDocCollaboratorInfoModel get notSuccessCase =>
      CollaborativeDocCollaboratorInfoModel(
        collaboratorDocInfo: Stream.value(
          CollaboratorDocInfo(
            isPresent: true,
            delta: 2,
          ),
        ),
      );
  static Either<Failure, CollaborativeDocCollaboratorInfoModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorInfoModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
