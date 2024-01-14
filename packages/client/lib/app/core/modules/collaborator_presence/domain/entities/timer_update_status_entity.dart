import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class TimerUpdateStatusEntity extends BaseSingleBooleanEntity {
  const TimerUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory TimerUpdateStatusEntity.initial() =>
      const TimerUpdateStatusEntity(isUpdated: false);
}
