import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class WhoAsTheQuestionEntity extends DefaultDBStatusEntity {
  const WhoAsTheQuestionEntity({required bool userHasTheQuestion})
      : super(isSent: userHasTheQuestion);
}
