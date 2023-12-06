import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

class IndividualSessionMetadataUpdateStatusModel
    extends IndividualSessionMetadataUpdateStatusEntity {
  const IndividualSessionMetadataUpdateStatusModel({required super.isUpdated});

  static IndividualSessionMetadataUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const IndividualSessionMetadataUpdateStatusModel(isUpdated: false);
    } else {
      return const IndividualSessionMetadataUpdateStatusModel(isUpdated: true);
    }
  }
}
