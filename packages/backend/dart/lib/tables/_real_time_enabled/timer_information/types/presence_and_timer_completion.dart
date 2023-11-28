import 'package:equatable/equatable.dart';

class PresenceAndTimerCompletion extends Equatable {
  final bool usersPresence;
  final bool collaboratorsPresence;
  final bool timerIsRunning;
  final bool bothCollaboratorsAreReadyToMoveOn;

  PresenceAndTimerCompletion({
    required this.bothCollaboratorsAreReadyToMoveOn,
    required this.usersPresence,
    required this.collaboratorsPresence,
    required this.timerIsRunning,
  });

  bool isDefault() {
    return !usersPresence &&
        !collaboratorsPresence &&
        !timerIsRunning &&
        !bothCollaboratorsAreReadyToMoveOn;
  }

  @override
  List<Object> get props => [
        usersPresence,
        collaboratorsPresence,
        timerIsRunning,
        bothCollaboratorsAreReadyToMoveOn,
      ];
}
