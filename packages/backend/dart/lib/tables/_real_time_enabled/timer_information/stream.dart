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

  Stream<PresenceAndTimerCompletion> getStream() async* {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    bool isListening = true;
    String hasCompletedTimer = TimerInformationQueries.hasCompletedTimer;
    String timerIsRunning = TimerInformationQueries.timerIsRunning;
    String isOnline = TimerInformationQueries.isOnline;
    String user = collaboratorInfo.theUsersCollaboratorNumber;
    String collaborator = collaboratorInfo.theCollaboratorsNumber;
    String userHasCompletedTimer = "${user}_$hasCompletedTimer";
    String collaboratorHasCompletedTimer = "${collaborator}_$hasCompletedTimer";
    String userIsOnline = "${user}_$isOnline";
    String collaboratorIsOnline = "${collaborator}_$isOnline";

    await for (var event in supabase
        .from(
      TimerInformationQueries.tableName,
    )
        .stream(primaryKey: ['id']).eq(
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
      collaboratorInfo.theUsersUID,
    )) {
      if (isListening == false) {
        return;
      }
      if (event.isEmpty) {
        yield PresenceAndTimerCompletion(
          bothCollaboratorsAreReadyToMoveOn: false,
          usersPresence: false,
          collaboratorsPresence: false,
          timerIsRunning: false,
        );
      } else {
        final bothCollaboratorsHaveCompletedTimer =
            event.first[userHasCompletedTimer] &&
                event.first[collaboratorHasCompletedTimer];
        yield PresenceAndTimerCompletion(
            usersPresence: event.first[userIsOnline],
            collaboratorsPresence: event.first[collaboratorIsOnline],
            bothCollaboratorsAreReadyToMoveOn:
                bothCollaboratorsHaveCompletedTimer,
            timerIsRunning: event.first[timerIsRunning]);
      }
    }
  }
}
