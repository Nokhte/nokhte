import 'package:primala/app/core/entities/default_db_status_entity.dart';

class P2PRequestRecipientResponseStatusEntity extends DefaultDBStatusEntity {
  const P2PRequestRecipientResponseStatusEntity({
    required isSent,
  }) : super(isSent: isSent);
}
