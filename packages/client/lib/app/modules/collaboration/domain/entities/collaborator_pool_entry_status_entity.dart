import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class CollaboratorPoolEntryStatusEntity extends BaseSingleBooleanEntity {
  const CollaboratorPoolEntryStatusEntity({required hasEntered})
      : super(isTrue: hasEntered);

  factory CollaboratorPoolEntryStatusEntity.initial() =>
      const CollaboratorPoolEntryStatusEntity(hasEntered: false);
}
