import 'package:equatable/equatable.dart';

class CollaborationSessionMetadata extends Equatable {
  final bool userIsOnCall;
  final bool collaboratorIsOnCall;
  final bool userIsOnline;
  final bool collaboratorIsOnline;
  final bool timerShouldRun;
  final bool collaboratorIsTalking;
  final bool userIsTalking;
  final double collaboratorPhase;
  final double userPhase;

  CollaborationSessionMetadata({
    required this.userIsOnCall,
    required this.collaboratorIsOnCall,
    required this.userIsOnline,
    required this.collaboratorIsOnline,
    required this.timerShouldRun,
    required this.collaboratorIsTalking,
    required this.collaboratorPhase,
    required this.userPhase,
    required this.userIsTalking,
  });

  factory CollaborationSessionMetadata.initial({
    bool userIsOnCallParam = false,
    bool collaboratorIsOnCallParam = false,
    bool userIsOnlineParam = false,
    bool collaboratorIsOnlineParam = false,
    bool timerShouldRunParam = false,
    bool collaboratorIsTalkingParam = false,
    double userPhaseParam = 0,
    double collaboratorPhaseParam = 0,
    bool userIsTalkingParam = false,
  }) =>
      CollaborationSessionMetadata(
        collaboratorIsOnCall: userIsOnCallParam,
        userIsOnline: collaboratorIsOnCallParam,
        userIsOnCall: userIsOnlineParam,
        collaboratorIsOnline: collaboratorIsOnlineParam,
        timerShouldRun: timerShouldRunParam,
        collaboratorIsTalking: collaboratorIsTalkingParam,
        userPhase: userPhaseParam,
        collaboratorPhase: collaboratorPhaseParam,
        userIsTalking: userIsTalkingParam,
      );

  @override
  List<Object> get props => [
        collaboratorIsOnCall,
        userIsOnline,
        userIsOnCall,
        collaboratorIsOnline,
        timerShouldRun,
        collaboratorIsTalking,
        userPhase,
        userIsTalking,
        collaboratorPhase
      ];
}
