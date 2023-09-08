import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

class ConstantCollaborativeDocContentEntity {
  static CollaborativeDocContentEntity get successCase =>
      CollaborativeDocContentEntity(docContent: Stream.value("content"));
  static CollaborativeDocContentEntity get notSuccessCase =>
      CollaborativeDocContentEntity(docContent: Stream.value(""));
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
