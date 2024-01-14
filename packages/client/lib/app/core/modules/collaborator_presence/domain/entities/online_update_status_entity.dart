import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class OnlineUpdateStatusEntity extends BaseSingleBooleanEntity {
  const OnlineUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory OnlineUpdateStatusEntity.initial() =>
      const OnlineUpdateStatusEntity(isUpdated: false);
}
