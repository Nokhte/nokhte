import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';

class CollaboratorPhraseValidationModel
    extends CollaboratorPhraseValidationEntity {
  const CollaboratorPhraseValidationModel(
      {required bool super.isValid, required super.phraseIDs});

  static CollaboratorPhraseValidationModel fromSupabase(
      {required List adjRes, required List nounRes}) {
    if (adjRes.isNotEmpty && nounRes.isNotEmpty) {
      final nounID = nounRes.first["id"];
      final adjectiveID = adjRes.first["id"];
      return CollaboratorPhraseValidationModel(
        isValid: true,
        phraseIDs: CollaboratorPhraseIDs(
          adjectiveID: adjectiveID,
          nounID: nounID,
        ),
      );
    } else {
      return CollaboratorPhraseValidationModel(
        isValid: false,
        phraseIDs: DefaultEntities.defaultCollaboratorPhraseIDs,
      );
    }
  }
}
