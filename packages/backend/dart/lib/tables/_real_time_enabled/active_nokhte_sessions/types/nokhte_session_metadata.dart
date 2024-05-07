import 'package:equatable/equatable.dart';

class NokhteSessionMetadata extends Equatable {
  final bool everyoneIsOnline;
  final bool everyoneHasGyroscopes;
  final List phases;
  final bool sessionHasBegun;
  final bool userCanSpeak;
  final bool userIsSpeaking;
  final int userIndex;
  final bool isAPremiumSession;

  NokhteSessionMetadata({
    required this.everyoneIsOnline,
    required this.phases,
    required this.everyoneHasGyroscopes,
    required this.userCanSpeak,
    required this.userIsSpeaking,
    required this.sessionHasBegun,
    required this.userIndex,
    required this.isAPremiumSession,
  });

  factory NokhteSessionMetadata.initial() => NokhteSessionMetadata(
        sessionHasBegun: false,
        everyoneHasGyroscopes: false,
        isAPremiumSession: false,
        userCanSpeak: false,
        userIsSpeaking: false,
        everyoneIsOnline: false,
        phases: List.filled(9, -1),
        userIndex: 0,
      );

  @override
  List<Object> get props => [
        everyoneIsOnline,
        isAPremiumSession,
        everyoneHasGyroscopes,
        phases,
        userCanSpeak,
        userIsSpeaking,
        sessionHasBegun,
        userIndex,
      ];
}
