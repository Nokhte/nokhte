import 'package:nokhte/app/core/entities/default_db_status_entity.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';

class CollaboratorPhraseValidationEntity extends DefaultDBStatusEntity {
  final CollaboratorPhraseIDs phraseIDs;
  const CollaboratorPhraseValidationEntity({
    required isValid,
    required this.phraseIDs,
  }) : super(isSent: isValid);
}
