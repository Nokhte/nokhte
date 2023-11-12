// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/mobx.dart';
part 'collective_session_phase1_coordinator.g.dart';

class CollectiveSessionPhase1Coordinator = _CollectiveSessionPhase1CoordinatorBase
    with _$CollectiveSessionPhase1Coordinator;

abstract class _CollectiveSessionPhase1CoordinatorBase
    extends BaseQuadrantAPIReceiver with Store {
  final ChangeAudioPlayingStatusStore audioPlayer;
  final MoveIndividualPerspectivesAudioToCollectiveSpaceStore moveTheAudio;
  final GetCollaboratorPerspectivesStore getCollaboratorPerspectives;

  _CollectiveSessionPhase1CoordinatorBase({
    required super.quadrantAPI,
    required this.audioPlayer,
    required this.moveTheAudio,
    required this.getCollaboratorPerspectives,
  });

  @override
  List<Object> get props => [];
}
