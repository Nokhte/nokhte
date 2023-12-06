import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class SoloDocSubmissionStatusEntity extends DefaultDBStatusEntity {
  const SoloDocSubmissionStatusEntity({required isSubmitted})
      : super(isSent: isSubmitted);
}
