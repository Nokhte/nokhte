import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class AgoraSdkStatusEntity extends DefaultDBStatusEntity {
  const AgoraSdkStatusEntity({required isInstantiated})
      : super(isSent: isInstantiated);
}
