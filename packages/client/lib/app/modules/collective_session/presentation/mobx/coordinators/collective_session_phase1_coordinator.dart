// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'collective_session_phase1_coordinator.g.dart';

class CollectiveSessionPhase1Coordinator = _CollectiveSessionPhase1CoordinatorBase
    with _$CollectiveSessionPhase1Coordinator;

abstract class _CollectiveSessionPhase1CoordinatorBase
    extends BaseQuadrantAPIReceiver with Store {
  // this is the view the other persons perspectives so not agora (yet)
  final MoveIndividualPerspectivesAudioToCollectiveSpaceStore moveTheAudio;

  _CollectiveSessionPhase1CoordinatorBase({
    required super.quadrantAPI,
    required this.moveTheAudio,
  });
  @override
  List<Object> get props => [];
}
