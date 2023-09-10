import 'package:primala/app/core/entities/default_db_status_entity.dart';

class SoloDocSharingStatusEntity extends DefaultDBStatusEntity {
  const SoloDocSharingStatusEntity({required isShared})
      : super(isSent: isShared);
}
