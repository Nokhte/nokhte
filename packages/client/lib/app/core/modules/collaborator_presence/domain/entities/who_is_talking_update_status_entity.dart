import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class WhoIsTalkingUpdateStatusEntity extends BaseSingleBooleanEntity {
  const WhoIsTalkingUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory WhoIsTalkingUpdateStatusEntity.initial() =>
      const WhoIsTalkingUpdateStatusEntity(isUpdated: false);
}
