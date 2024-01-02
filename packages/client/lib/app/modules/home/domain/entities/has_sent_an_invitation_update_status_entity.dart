import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class HasSentAnInvitationUpdateStatusEntity extends DefaultDBStatusEntity {
  const HasSentAnInvitationUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
