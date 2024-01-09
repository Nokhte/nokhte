import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorPoolEntryStatusEntity extends DefaultDBStatusEntity {
  const CollaboratorPoolEntryStatusEntity({required hasEntered})
      : super(isSent: hasEntered);

  factory CollaboratorPoolEntryStatusEntity.initial() =>
      const CollaboratorPoolEntryStatusEntity(hasEntered: false);
}
