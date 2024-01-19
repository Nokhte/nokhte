import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class PhaseUpdateStatusEntity extends BaseSingleBooleanEntity {
  const PhaseUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  factory PhaseUpdateStatusEntity.initial() =>
      const PhaseUpdateStatusEntity(isUpdated: false);
}
