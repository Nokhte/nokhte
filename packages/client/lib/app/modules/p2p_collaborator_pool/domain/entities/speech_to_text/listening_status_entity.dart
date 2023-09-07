import 'package:primala/app/core/entities/default_db_status_entity.dart';

class ListeningStatusEntity extends DefaultDBStatusEntity {
  const ListeningStatusEntity({required bool isListening})
      : super(
          isSent: isListening,
        );
}
