import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class PurposeSessionArtifactAbortionStatusEntity extends DefaultDBStatusEntity {
  const PurposeSessionArtifactAbortionStatusEntity({required bool isAborted})
      : super(isSent: isAborted);
}
