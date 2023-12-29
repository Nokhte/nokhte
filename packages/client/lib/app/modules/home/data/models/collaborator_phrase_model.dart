import 'package:nokhte/app/modules/home/domain/entities/entities.dart';

class CollaboratorPhraseModel extends CollaboratorPhraseEntity {
  const CollaboratorPhraseModel({required super.collaboratorPhrase});

  factory CollaboratorPhraseModel.fromSupabase(List sbQueryRes) {
    return CollaboratorPhraseModel(
        collaboratorPhrase: sbQueryRes.first["collaborator_phrase"]);
  }
}
