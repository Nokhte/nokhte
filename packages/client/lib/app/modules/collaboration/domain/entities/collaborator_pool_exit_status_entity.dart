import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class CollaboratorPoolExitStatusEntity extends BaseSingleBooleanEntity {
  const CollaboratorPoolExitStatusEntity({required hasLeft})
      : super(isTrue: hasLeft);

  factory CollaboratorPoolExitStatusEntity.initial() =>
      const CollaboratorPoolExitStatusEntity(hasLeft: false);
}
