import 'package:equatable/equatable.dart';

class IrlNokhteSessionMetadata extends Equatable {
  final bool userIsOnline;
  final bool collaboratorIsOnline;
  final double collaboratorPhase;
  final double userPhase;

  IrlNokhteSessionMetadata({
    required this.userIsOnline,
    required this.collaboratorIsOnline,
    required this.collaboratorPhase,
    required this.userPhase,
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
        userPhase: userPhaseParam,
        collaboratorPhase: collaboratorPhaseParam,
      );

  @override
  List<Object> get props =>
      [userIsOnline, collaboratorIsOnline, userPhase, collaboratorPhase];
}
