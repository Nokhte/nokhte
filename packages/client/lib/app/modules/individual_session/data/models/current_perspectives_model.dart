import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';

class CurrentPerspectivesModel extends CurrentPerspectivesEntity {
  const CurrentPerspectivesModel({
    required super.currentPerspectives,
    required super.currentPerspectiveTimestamp,
  });

  static CurrentPerspectivesModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return CurrentPerspectivesModel(
        currentPerspectives: const [],
        currentPerspectiveTimestamp: DateTime.fromMicrosecondsSinceEpoch(0),
      );
    } else {
      return CurrentPerspectivesModel(
        currentPerspectives: sbQueryRes[0]
            [P2PPerspectivesTrackingQueries.currentPerspectives],
        currentPerspectiveTimestamp: DateTime.parse(
          sbQueryRes[0][P2PPerspectivesTrackingQueries.currentCommittedAt],
        ),
      );
    }
  }
}
