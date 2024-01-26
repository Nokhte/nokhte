import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';
import '../responses/responses.dart';

class ConstantCollaborativeDocContentModel {
  static CollaborativeDocContentModel get successCase =>
      CollaborativeDocContentModel(
          docContent: DocContentResonse.successfulResponse);
  static CollaborativeDocContentModel get notSuccessCase =>
      CollaborativeDocContentModel(
        docContent: DocContentResonse.notSuccessfulResponse,
      );
  static Either<Failure, CollaborativeDocContentModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, CollaborativeDocContentModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
