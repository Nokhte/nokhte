import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class MeetingIdAndTokenUpdateStatusEntity extends BaseSingleBooleanEntity {
  const MeetingIdAndTokenUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory MeetingIdAndTokenUpdateStatusEntity.initial() =>
      const MeetingIdAndTokenUpdateStatusEntity(
        isUpdated: false,
      );
}
