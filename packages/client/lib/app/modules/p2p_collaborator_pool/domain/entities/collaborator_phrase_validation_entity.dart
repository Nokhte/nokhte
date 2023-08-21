import 'package:primala/app/core/entities/default_db_status_entity.dart';

class CollaboratorPhraseValidationEntity extends DefaultDBStatusEntity {
  const CollaboratorPhraseValidationEntity({required isValid})
      : super(isSent: isValid);
}
