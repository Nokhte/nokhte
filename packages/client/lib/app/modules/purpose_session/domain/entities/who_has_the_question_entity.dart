import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class WhoHasTheQuestionEntity extends BaseSingleBooleanEntity {
  const WhoHasTheQuestionEntity({required bool hasTheQuestion})
      : super(isTrue: hasTheQuestion);

  factory WhoHasTheQuestionEntity.initial() =>
      const WhoHasTheQuestionEntity(hasTheQuestion: false);
}
