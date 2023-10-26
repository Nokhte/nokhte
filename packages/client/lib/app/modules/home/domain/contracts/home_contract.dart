import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';

abstract class HomeContract {
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase();
  Future<Either<Failure, CollaboratorPhraseEntity>> getCollaboratorPhrase();
}
