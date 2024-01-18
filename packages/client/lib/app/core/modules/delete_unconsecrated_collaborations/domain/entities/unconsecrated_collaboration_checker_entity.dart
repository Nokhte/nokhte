import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class UnconsecratedCollaborationCheckerEntity extends BaseSingleBooleanEntity {
  final String collaboratorOneUID;
  final String collaboratorTwoUID;
  const UnconsecratedCollaborationCheckerEntity({
    required bool hasOne,
    required this.collaboratorOneUID,
    required this.collaboratorTwoUID,
  }) : super(isTrue: hasOne);

  factory UnconsecratedCollaborationCheckerEntity.initial() =>
      const UnconsecratedCollaborationCheckerEntity(
        collaboratorOneUID: '',
        collaboratorTwoUID: '',
        hasOne: false,
      );
}
