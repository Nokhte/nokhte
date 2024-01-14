import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class CollaborationArtifactDeleteStatusEntity extends BaseSingleBooleanEntity {
  const CollaborationArtifactDeleteStatusEntity({required bool isDeleted})
      : super(isTrue: isDeleted);
}
