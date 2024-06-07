import 'package:equatable/equatable.dart';

class NokhteSessionMetadata extends Equatable {
  final bool everyoneIsOnline;
  final List phases;
  final bool sessionHasBegun;
  final int userIndex;
  final bool userCanSpeak;
  final bool userIsSpeaking;
  final bool isAValidSession;
  final List shouldSkipInstructions;
  final bool isWhitelisted;

  NokhteSessionMetadata({
    required this.everyoneIsOnline,
    required this.phases,
    required this.userCanSpeak,
    required this.isWhitelisted,
    required this.userIsSpeaking,
    required this.sessionHasBegun,
    required this.userIndex,
    required this.isAValidSession,
    required this.shouldSkipInstructions,
  });

  factory NokhteSessionMetadata.initial() => NokhteSessionMetadata(
        sessionHasBegun: false,
        userCanSpeak: false,
        isWhitelisted: false,
        userIsSpeaking: false,
        everyoneIsOnline: false,
        isAValidSession: false,
        phases: List.filled(9, -1),
        shouldSkipInstructions: List.filled(9, false),
        userIndex: 0,
      );

  @override
  List<Object> get props => [
        everyoneIsOnline,
        isWhitelisted,
        phases,
        sessionHasBegun,
        userCanSpeak,
        userIsSpeaking,
        userIndex,
        isAValidSession,
      ];
}
