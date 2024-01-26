import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualPerspectivesAudioUploadStatusEntity
    extends DefaultDBStatusEntity {
  const IndividualPerspectivesAudioUploadStatusEntity(
      {required bool isUploaded})
      : super(isSent: isUploaded);
}
