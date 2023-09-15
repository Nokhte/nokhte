import 'package:primala/app/core/entities/default_db_status_entity.dart';
import 'package:primala_backend/phrase_components.dart';

class CollaboratorPhraseValidationEntity extends DefaultDBStatusEntity {
  final CollaboratorPhraseIDs phraseIDs;
  const CollaboratorPhraseValidationEntity({
    required isValid,
    required this.phraseIDs,
  }) : super(isSent: isValid);
}
