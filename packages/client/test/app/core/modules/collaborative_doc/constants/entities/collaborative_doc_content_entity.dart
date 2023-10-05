import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

import '../responses/doc_content_response.dart';

class ConstantCollaborativeDocContentEntity {
  static CollaborativeDocContentEntity get successCase =>
      CollaborativeDocContentEntity(
          docContent: DocContentResonse.successfulResponse);
  static CollaborativeDocContentEntity get notSuccessCase =>
      CollaborativeDocContentEntity(
        docContent: DocContentResonse.notSuccessfulResponse,
      );
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
