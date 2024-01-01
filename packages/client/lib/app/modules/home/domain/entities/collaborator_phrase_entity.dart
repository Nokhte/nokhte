import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';

class CollaboratorPhraseEntity extends Equatable {
  final String collaboratorPhrase;

  const CollaboratorPhraseEntity({required this.collaboratorPhrase});

  static Either<Failure, CollaboratorPhraseEntity> get initial =>
      const Right(CollaboratorPhraseEntity(collaboratorPhrase: ''));

  @override
  List<Object> get props => [collaboratorPhrase];
}
