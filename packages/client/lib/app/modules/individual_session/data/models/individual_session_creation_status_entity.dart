import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte_backend/individual_sessions.dart';

class IndividualSessionCreationModel extends IndividualSessionCreationEntity {
  const IndividualSessionCreationModel({required super.sessionTimestamp});

  static IndividualSessionCreationModel fromSupabase(List res) {
    if (res.isEmpty) {
      return IndividualSessionCreationModel(
          sessionTimestamp: DateTime.fromMicrosecondsSinceEpoch(0));
    } else {
      return IndividualSessionCreationModel(
          sessionTimestamp: DateTime.parse(
        res[0][IndividualSessionsQueries.sessionHeldAt],
      ));
    }
  }
}
