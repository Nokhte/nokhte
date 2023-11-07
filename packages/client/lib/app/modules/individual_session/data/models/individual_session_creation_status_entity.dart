import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

class IndividualSessionCreationStatusModel
    extends IndividualSessionCreationStatusEntity {
  const IndividualSessionCreationStatusModel({required super.isCreated});

  static IndividualSessionCreationStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const IndividualSessionCreationStatusModel(isCreated: false);
    } else {
      return const IndividualSessionCreationStatusModel(isCreated: true);
    }
  }
}
