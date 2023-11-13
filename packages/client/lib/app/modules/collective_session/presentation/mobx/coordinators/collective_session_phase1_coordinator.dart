// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/mobx.dart';
part 'collective_session_phase1_coordinator.g.dart';

class CollectiveSessionPhase1Coordinator = _CollectiveSessionPhase1CoordinatorBase
    with _$CollectiveSessionPhase1Coordinator;

abstract class _CollectiveSessionPhase1CoordinatorBase
    extends BaseQuadrantAPIReceiver with Store {
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final CollectiveSessionPhase1WidgetsCoordinator widgets;
  final ChangeAudioPlayingStatusStore audioPlayer;
  final SwipeDetector swipe;
  final MoveIndividualPerspectivesAudioToCollectiveSpaceStore moveTheAudio;
  final GetCollaboratorPerspectivesStore getCollaboratorPerspectives;

  final quadNum = 5;
  final quadSpread = 90;

  _CollectiveSessionPhase1CoordinatorBase({
    required super.quadrantAPI,
    required this.getCurrentPerspectives,
    required this.swipe,
    required this.audioPlayer,
    required this.getCollaboratorPerspectives,
    required this.moveTheAudio,
    required this.widgets,
  });

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets(DateTime.now());
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    // quadrantAPIListener();
    //
  }

  @override
  List<Object> get props => [];
}
