import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class LocalAudioStreamStatusEntity extends BaseSingleBooleanEntity {
  const LocalAudioStreamStatusEntity({required isMuted})
      : super(isTrue: isMuted);
}
