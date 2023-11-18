import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class TimerMarkdownStatusEntity extends DefaultDBStatusEntity {
  const TimerMarkdownStatusEntity({required bool isMarkedDown})
      : super(isSent: isMarkedDown);
}
