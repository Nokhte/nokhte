import 'package:primala/app/core/entities/default_db_status_entity.dart';

class InitLeopardStatusEntity extends DefaultDBStatusEntity {
  final bool isInitialized;

  const InitLeopardStatusEntity({required this.isInitialized})
      : super(isSent: isInitialized);
}
