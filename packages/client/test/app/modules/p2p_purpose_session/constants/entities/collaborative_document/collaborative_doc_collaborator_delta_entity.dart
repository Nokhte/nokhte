import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocDeltaEntity {
  static CollaborativeDocCollaboratorDeltaEntity get successCase =>
      CollaborativeDocCollaboratorDeltaEntity(delta: Stream.value(1));
  static CollaborativeDocCollaboratorDeltaEntity get notSuccessCase =>
      CollaborativeDocCollaboratorDeltaEntity(delta: Stream.value(-1));
  static Either<Failure, CollaborativeDocCollaboratorDeltaEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorDeltaEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
