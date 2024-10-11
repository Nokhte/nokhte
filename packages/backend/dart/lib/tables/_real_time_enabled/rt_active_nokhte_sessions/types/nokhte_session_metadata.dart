import 'package:equatable/equatable.dart';

class NokhteSessionMetadata extends Equatable {
  final bool everyoneIsOnline;
  final List phases;
  final bool sessionHasBegun;
  final bool userCanSpeak;
  final bool userIsSpeaking;
  final bool userIsBeingRalliedWith;
  final DateTime speakingTimerStart;

  NokhteSessionMetadata({
    required this.everyoneIsOnline,
    required this.phases,
    required this.userCanSpeak,
    required this.userIsSpeaking,
    required this.sessionHasBegun,
    required this.userIsBeingRalliedWith,
    required this.speakingTimerStart,
  });

  @override
  List<Object> get props => [
        everyoneIsOnline,
        userIsBeingRalliedWith,
        phases,
        sessionHasBegun,
        userCanSpeak,
        userIsSpeaking,
      ];
}
