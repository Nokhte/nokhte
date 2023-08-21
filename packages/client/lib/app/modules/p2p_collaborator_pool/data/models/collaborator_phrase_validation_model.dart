import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class CollaboratorPhraseValidationModel
    extends CollaboratorPhraseValidationEntity {
  const CollaboratorPhraseValidationModel({required bool isValid})
      : super(isValid: isValid);

  static CollaboratorPhraseValidationModel fromSupabase(
      {required List adjectiveRes, required List nounRes}) {
    if (adjectiveRes.isEmpty | nounRes.isEmpty) {
      return const CollaboratorPhraseValidationModel(isValid: false);
    } else {
      return const CollaboratorPhraseValidationModel(isValid: true);
    }
  }
}
