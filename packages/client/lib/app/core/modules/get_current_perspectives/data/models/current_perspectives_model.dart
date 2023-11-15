import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';

class CurrentPerspectivesModel extends CurrentPerspectivesEntity {
  const CurrentPerspectivesModel({
    required super.theUsersUID,
    required super.currentPerspectives,
    required super.currentPerspectiveTimestamp,
  });

  static CurrentPerspectivesModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return CurrentPerspectivesModel(
        theUsersUID: '',
        currentPerspectives: const [],
        currentPerspectiveTimestamp: DateTime.fromMicrosecondsSinceEpoch(0),
      );
    } else {
      return CurrentPerspectivesModel(
        theUsersUID: sbQueryRes[1],
        currentPerspectives: sbQueryRes
            .first.first[P2PPerspectivesTrackingQueries.currentPerspectives],
        currentPerspectiveTimestamp: DateTime.parse(
          sbQueryRes
              .first.first[P2PPerspectivesTrackingQueries.currentCommittedAt],
        ),
      );
    }
  }
}
