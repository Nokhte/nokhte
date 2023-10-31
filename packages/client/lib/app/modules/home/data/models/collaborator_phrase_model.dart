import 'package:nokhte/app/modules/home/domain/entities/entities.dart';

class CollaboratorPhraseModel extends CollaboratorPhraseEntity {
  const CollaboratorPhraseModel({required super.collaboratorPhrase});

  static CollaboratorPhraseModel fromSupabase(List sbQueryRes) {
    return CollaboratorPhraseModel(
        collaboratorPhrase: sbQueryRes[0]["collaborator_phrase"]);
  }
}
