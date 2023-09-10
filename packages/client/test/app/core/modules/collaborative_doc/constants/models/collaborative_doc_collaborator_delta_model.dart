import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocDeltaModel {
  static CollaborativeDocCollaboratorDeltaModel get successCase =>
      CollaborativeDocCollaboratorDeltaModel(delta: Stream.value(1));
  static CollaborativeDocCollaboratorDeltaModel get notSuccessCase =>
      CollaborativeDocCollaboratorDeltaModel(delta: Stream.value(-1));
  static Either<Failure, CollaborativeDocCollaboratorDeltaModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorDeltaModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
