import 'package:primala/app/core/entities/default_db_status_entity.dart';

class SpeechToTextInitializerStatusEntity extends DefaultDBStatusEntity {
  const SpeechToTextInitializerStatusEntity({required bool isAllowed})
      : super(
          isSent: isAllowed,
        );
}
