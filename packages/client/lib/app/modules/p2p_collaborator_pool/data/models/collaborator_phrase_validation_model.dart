import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte_backend/phrase_components.dart';

class CollaboratorPhraseValidationModel
    extends CollaboratorPhraseValidationEntity {
  const CollaboratorPhraseValidationModel(
      {required bool isValid, required CollaboratorPhraseIDs phraseIDs})
      : super(isValid: isValid, phraseIDs: phraseIDs);

  static CollaboratorPhraseValidationModel fromSupabase(
      {required List adjRes, required List nounRes}) {
    if (adjRes.isNotEmpty && nounRes.isNotEmpty) {
      final nounID = nounRes[0]["id"];
      final adjectiveID = adjRes[0]["id"];
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
