import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

class ConstantCollaborativeDocContentModel {
  static CollaborativeDocContentModel get successCase =>
      CollaborativeDocContentModel(
          docContent: Stream.value(
        DocInfoContent(
          content: "content",
          lastEditedBy: "lastEditedBy",
          currentUserUID: "lastEditedBy",
        ),
      ));
  static CollaborativeDocContentModel get notSuccessCase =>
      CollaborativeDocContentModel(
        docContent: Stream.value(
          DocInfoContent(
            content: "",
            lastEditedBy: "",
            currentUserUID: "",
          ),
        ),
      );
  static Either<Failure, CollaborativeDocContentModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, CollaborativeDocContentModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
