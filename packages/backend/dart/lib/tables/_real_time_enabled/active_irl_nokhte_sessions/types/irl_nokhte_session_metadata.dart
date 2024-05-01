import 'package:equatable/equatable.dart';

class IrlNokhteSessionMetadata extends Equatable {
  final bool everyoneIsOnline;
  final bool everyoneHasGyroscopes;
  final List phases;
  final bool sessionHasBegun;
  final bool userCanSpeak;
  final bool userIsSpeaking;
  final int userIndex;

  IrlNokhteSessionMetadata({
    required this.everyoneIsOnline,
    required this.phases,
    required this.everyoneHasGyroscopes,
    required this.userCanSpeak,
    required this.userIsSpeaking,
    required this.sessionHasBegun,
    required this.userIndex,
  });

  factory IrlNokhteSessionMetadata.initial() => IrlNokhteSessionMetadata(
        sessionHasBegun: false,
        everyoneHasGyroscopes: false,
        userCanSpeak: false,
        userIsSpeaking: false,
        everyoneIsOnline: false,
        phases: List.filled(9, -1),
        userIndex: 0,
      );

  @override
  List<Object> get props => [
        everyoneIsOnline,
        everyoneHasGyroscopes,
        phases,
        userCanSpeak,
        userIsSpeaking,
        sessionHasBegun,
        userIndex,
      ];
}
