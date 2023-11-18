import 'package:nokhte_backend/tables/_real_time_enabled/shared/collaborative_queries.dart';
import 'package:nokhte_backend/tables/timer_information.dart';

class TimerInformationStreams extends CollaborativeQueries {
  bool isLisening = false;
  String userUID = '';
  TimerInformationStreams({required super.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  dispose() {
    isLisening = false;
  }

  Stream<PresenceAndTimeRemaining> getStream() async* {
    bool isListening = true;
    String usersCollaboratorNumber = "";
    String collaboratorsNumber = "";
    String remainingTime = TimerInformationQueries.timeRemainingInMilliseconds;
    String timerIsRunning = TimerInformationQueries.timerIsRunning;
    String isOnline = TimerInformationQueries.isOnline;

    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
      usersCollaboratorNumber = collaboratorInfo.theUsersCollaboratorNumber;
      collaboratorsNumber = collaboratorInfo.theCollaboratorsNumber;
    }
    await for (var event in supabase
        .from(
      TimerInformationQueries.tableName,
    )
        .stream(primaryKey: ['id']).eq(
      "${usersCollaboratorNumber}_uid",
      collaboratorInfo.theUsersUID,
    )) {
      if (isListening == false) {
        return;
      }
      if (event.isEmpty) {
        yield PresenceAndTimeRemaining(
          remainingTimeInMilliseconds: -1,
          usersPresence: false,
          collaboratorsPresence: false,
          timerIsRunning: false,
        );
      } else {
        yield PresenceAndTimeRemaining(
            remainingTimeInMilliseconds: event.first[remainingTime].toDouble(),
            usersPresence: event.first["${usersCollaboratorNumber}_$isOnline"],
            collaboratorsPresence:
                event.first["${collaboratorsNumber}_$isOnline"],
            timerIsRunning: event.first[timerIsRunning]);
      }
    }
  }
}
