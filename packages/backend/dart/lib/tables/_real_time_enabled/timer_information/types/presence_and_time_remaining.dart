import 'package:equatable/equatable.dart';

class PresenceAndTimeRemaining extends Equatable {
  final double remainingTimeInMilliseconds;
  final bool usersPresence;
  final bool collaboratorsPresence;
  final bool timerIsRunning;

  PresenceAndTimeRemaining({
    required this.remainingTimeInMilliseconds,
    required this.usersPresence,
    required this.collaboratorsPresence,
    required this.timerIsRunning,
  });

  @override
  List<Object> get props => [
        remainingTimeInMilliseconds,
        usersPresence,
        collaboratorsPresence,
      ];
}
