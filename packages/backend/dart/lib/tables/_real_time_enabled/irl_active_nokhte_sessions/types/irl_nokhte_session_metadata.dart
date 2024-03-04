import 'package:equatable/equatable.dart';

class IrlNokhteSessionMetadata extends Equatable {
  final bool userIsOnline;
  final bool collaboratorIsOnline;
  final bool collaboratorIsTalking;
  final bool userIsTalking;
  final double collaboratorPhase;
  final double userPhase;

  IrlNokhteSessionMetadata({
    required this.userIsOnline,
    required this.collaboratorIsOnline,
    required this.collaboratorIsTalking,
    required this.collaboratorPhase,
    required this.userPhase,
    required this.userIsTalking,
  });

  factory IrlNokhteSessionMetadata.initial({
    bool userIsOnlineParam = false,
    bool collaboratorIsOnlineParam = false,
    bool collaboratorIsTalkingParam = false,
    double userPhaseParam = 0,
    double collaboratorPhaseParam = 0,
    bool userIsTalkingParam = false,
  }) =>
      IrlNokhteSessionMetadata(
        userIsOnline: userIsOnlineParam,
        collaboratorIsOnline: collaboratorIsOnlineParam,
        collaboratorIsTalking: collaboratorIsTalkingParam,
        userPhase: userPhaseParam,
        collaboratorPhase: collaboratorPhaseParam,
        userIsTalking: userIsTalkingParam,
      );

  @override
  List<Object> get props => [
        userIsOnline,
        collaboratorIsOnline,
        collaboratorIsTalking,
        userPhase,
        userIsTalking,
        collaboratorPhase
      ];
}
