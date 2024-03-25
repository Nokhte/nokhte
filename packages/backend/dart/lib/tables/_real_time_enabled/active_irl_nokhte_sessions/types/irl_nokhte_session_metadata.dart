import 'package:equatable/equatable.dart';

class IrlNokhteSessionMetadata extends Equatable {
  final bool userIsOnline;
  final bool collaboratorIsOnline;
  final double collaboratorPhase;
  final double userPhase;
  final bool collaboratorHasGyroscope;
  final bool userHasGyroscope;

  IrlNokhteSessionMetadata({
    required this.userIsOnline,
    required this.collaboratorIsOnline,
    required this.collaboratorPhase,
    required this.userPhase,
    required this.collaboratorHasGyroscope,
    required this.userHasGyroscope,
  });

  factory IrlNokhteSessionMetadata.initial({
    bool userIsOnlineParam = false,
    bool collaboratorIsOnlineParam = false,
    bool collaboratorIsTalkingParam = false,
    double userPhaseParam = 0,
    double collaboratorPhaseParam = 0,
    bool userIsTalkingParam = false,
    bool collaboratorHasGyroscopeParam = false,
    bool userHasGyroscopeParam = false,
  }) =>
      IrlNokhteSessionMetadata(
        userIsOnline: userIsOnlineParam,
        collaboratorIsOnline: collaboratorIsOnlineParam,
        userPhase: userPhaseParam,
        collaboratorPhase: collaboratorPhaseParam,
        collaboratorHasGyroscope: collaboratorHasGyroscopeParam,
        userHasGyroscope: userHasGyroscopeParam,
      );

  @override
  List<Object> get props => [
        userIsOnline,
        collaboratorIsOnline,
        userPhase,
        collaboratorPhase,
        collaboratorHasGyroscope,
        userHasGyroscope,
      ];
}
