import 'package:equatable/equatable.dart';

class CollaboratorPhraseEntity extends Equatable {
  final String collaboratorPhrase;

  const CollaboratorPhraseEntity({required this.collaboratorPhrase});
  @override
  List<Object> get props => [collaboratorPhrase];
}
