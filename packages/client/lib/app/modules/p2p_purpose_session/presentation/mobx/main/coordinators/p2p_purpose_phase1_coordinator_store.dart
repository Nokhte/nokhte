// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase1_coordinator_store.g.dart';

class P2PPurposePhase1CoordinatorStore = _P2PPurposePhase1CoordinatorStoreBase
    with _$P2PPurposePhase1CoordinatorStore;

abstract class _P2PPurposePhase1CoordinatorStoreBase extends Equatable
    with Store {
  // Logic Stores
  final InstantiateAgoraSdkStore instantiateAgoraSdkStore;
  final FetchAgoraTokenStore fetchAgoraTokenStore;
  final FetchChannelIdStore fetchChannelIdStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  // final

  // Widget Stores
  final BeachWavesTrackerStore beachWaves;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase1CoordinatorStoreBase({
    required this.instantiateAgoraSdkStore,
    required this.fetchAgoraTokenStore,
    required this.fetchChannelIdStore,
    required this.voiceCallActionsStore,
    required this.beachWaves,
    required this.fadingText,
  });

  @override
  List<Object> get props => [
// some items
      ];
}
