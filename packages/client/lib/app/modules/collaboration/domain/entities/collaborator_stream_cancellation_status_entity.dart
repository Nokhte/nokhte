import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class CollaboratorStreamCancellationStatusEntity
    extends BaseSingleBooleanEntity {
  const CollaboratorStreamCancellationStatusEntity({required isCancelled})
      : super(isTrue: isCancelled);

  factory CollaboratorStreamCancellationStatusEntity.initial() =>
      const CollaboratorStreamCancellationStatusEntity(isCancelled: false);
}
