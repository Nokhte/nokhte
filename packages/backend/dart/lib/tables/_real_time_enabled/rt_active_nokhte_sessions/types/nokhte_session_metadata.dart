import 'package:equatable/equatable.dart';

class NokhteSessionMetadata extends Equatable {
  final bool everyoneIsOnline;
  final List phases;
  final bool sessionHasBegun;
  final bool userCanSpeak;
  final bool userIsSpeaking;

  NokhteSessionMetadata({
    required this.everyoneIsOnline,
    required this.phases,
    required this.userCanSpeak,
    required this.userIsSpeaking,
    required this.sessionHasBegun,
  });

  factory NokhteSessionMetadata.initial() => NokhteSessionMetadata(
        sessionHasBegun: false,
        userCanSpeak: false,
        userIsSpeaking: false,
        everyoneIsOnline: false,
        phases: List.filled(9, -1),
      );

  @override
  List<Object> get props => [
        everyoneIsOnline,
        phases,
        sessionHasBegun,
        userCanSpeak,
        userIsSpeaking,
      ];
}
