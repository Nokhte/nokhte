import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class HasSentAnInvitationUpdateStatusEntity extends BaseSingleBooleanEntity {
  const HasSentAnInvitationUpdateStatusEntity({required bool isUpdated})
      : super(isTrue: isUpdated);

  static HasSentAnInvitationUpdateStatusEntity get initial =>
      const HasSentAnInvitationUpdateStatusEntity(isUpdated: false);
}
