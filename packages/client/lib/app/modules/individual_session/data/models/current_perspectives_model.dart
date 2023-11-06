import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';

class CurrentPerspectivesModel extends CurrentPerspectivesEntity {
  const CurrentPerspectivesModel({
    required super.currentPerspectives,
  });

  static CurrentPerspectivesModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CurrentPerspectivesModel(currentPerspectives: []);
    } else {
      return CurrentPerspectivesModel(
        currentPerspectives: sbQueryRes[0]
            [P2PPerspectivesTrackingQueries.currentPerspectives],
      );
    }
  }
}
