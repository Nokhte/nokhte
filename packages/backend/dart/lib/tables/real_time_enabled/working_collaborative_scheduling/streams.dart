import 'package:primala_backend/tables/real_time_enabled/shared/collaborative_queries.dart';
import 'package:primala_backend/working_collaborative_scheduling.dart';

class WorkingCollaborativeSchedulingStream extends CollaborativeQueries {
  WorkingCollaborativeSchedulingStream({required super.supabase});
  bool collaboratorTimeListeningStatus = false;
  bool collaboratorDateListeningStatus = false;

  Stream<CollaboratorsDateAndTime> collaboratorsDateAndTimeStream() async* {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await for (var event in supabase
        .from('working_collaborative_scheduling')
        .stream(primaryKey: ['id']).eq(
      '${collaboratorInfo.theUsersCollaboratorNumber}_uid',
      collaboratorInfo.theUsersUID,
    )) {
      //
      if (!collaboratorDateListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield CollaboratorsDateAndTime(
            date: DateTime.fromMicrosecondsSinceEpoch(0),
            time: DateTime.fromMicrosecondsSinceEpoch(0));
      } else {
        yield CollaboratorsDateAndTime(
          date: DateTime.parse(
            event[0]["${collaboratorInfo.theCollaboratorsNumber}_chosen_day"],
          ),
          time: DateTime.parse(
            event[0]["${collaboratorInfo.theCollaboratorsNumber}_chosen_time"],
          ),
        );
      }
    }
    //
  }
}
