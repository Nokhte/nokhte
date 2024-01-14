import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class CallUpdateStatusEntity extends BaseSingleBooleanEntity {
  const CallUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory CallUpdateStatusEntity.initial() =>
      const CallUpdateStatusEntity(isUpdated: false);
}
