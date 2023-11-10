import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorsAudioClipsDownloadStatusEntity
    extends DefaultDBStatusEntity {
  const CollaboratorsAudioClipsDownloadStatusEntity(
      {required bool isDownloaded})
      : super(isSent: isDownloaded);
}
