// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
part 'collective_session_phase2_coordinator.g.dart';

class CollectiveSessionPhase2Coordinator = _CollectiveSessionPhase2CoordinatorBase
    with _$CollectiveSessionPhase2Coordinator;

abstract class _CollectiveSessionPhase2CoordinatorBase extends Equatable
    with Store {
  final VoiceCallActionsStore voiceCall;
  final CollaborativeDocCoordinatorStore collaborativeDoc;

  _CollectiveSessionPhase2CoordinatorBase({
    required this.voiceCall,
    required this.collaborativeDoc,
  });
  @override
  List<Object> get props => [];
}
