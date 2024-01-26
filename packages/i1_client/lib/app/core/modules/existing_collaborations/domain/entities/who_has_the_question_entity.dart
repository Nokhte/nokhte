import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class WhoHasTheQuestionEntity extends DefaultDBStatusEntity {
  const WhoHasTheQuestionEntity({required bool userHasTheQuestion})
      : super(isSent: userHasTheQuestion);
}
