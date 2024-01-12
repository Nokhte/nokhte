import 'package:nokhte_backend/tables/_real_time_enabled/shared/collaborative_queries.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';

class WorkingCollaborativeSchedulingStream extends CollaborativeQueries {
  WorkingCollaborativeSchedulingStream({required super.supabase});
  bool listeningStatus = false;

  dispose() {
    listeningStatus = false;
  }

  Stream<CollaboratorsDateAndTime> collaboratorsDateAndTimeStream() async* {
    listeningStatus = true;
    await ensureActiveCollaboratorInfo();
    await for (var event in supabase
        .from('working_collaborative_scheduling')
        .stream(primaryKey: ['id']).eq(
      '${collaboratorInfo.theUsersCollaboratorNumber}_uid',
      collaboratorInfo.theUsersUID,
    )) {
      if (!listeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield CollaboratorsDateAndTime(
            date: DateTime.fromMicrosecondsSinceEpoch(0),
            time: DateTime.fromMicrosecondsSinceEpoch(0));
      } else {
        yield CollaboratorsDateAndTime(
          date: event.first[
                      "${collaboratorInfo.theCollaboratorsNumber}_chosen_day"] ==
                  null
              ? DateTime.fromMicrosecondsSinceEpoch(0)
              : DateTime.parse(event.first[
                  "${collaboratorInfo.theCollaboratorsNumber}_chosen_day"]),
          time: event.first[
                      "${collaboratorInfo.theCollaboratorsNumber}_chosen_time"] ==
                  null
              ? DateTime.fromMicrosecondsSinceEpoch(0)
              : DateTime.parse(event.first[
                  "${collaboratorInfo.theCollaboratorsNumber}_chosen_time"]),
        );
      }
    }
  }
}
