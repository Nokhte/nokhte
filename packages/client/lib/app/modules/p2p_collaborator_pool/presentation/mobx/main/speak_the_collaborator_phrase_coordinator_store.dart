// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'speak_the_collaborator_phrase_coordinator_store.g.dart';

class SpeakTheCollaboratorPhraseCoordinatorStore = _SpeakTheCollaboratorPhraseCoordinatorStoreBase
    with _$SpeakTheCollaboratorPhraseCoordinatorStore;

abstract class _SpeakTheCollaboratorPhraseCoordinatorStoreBase extends Equatable
    with Store {
  final CustomWidgetsTrackerStore widgetStore;
  final SpeechToTextStore speechToTextStore;
  final OnSpeechResultStore onSpeechResultStore;
  final ValidateQueryStore validateQueryStore;

  _SpeakTheCollaboratorPhraseCoordinatorStoreBase({
    required this.widgetStore,
    required this.speechToTextStore,
    required this.onSpeechResultStore,
    required this.validateQueryStore,
  });

  @action
  breathingPentagonsHoldStartCallback() {
    widgetStore.breathingPentagonsStore.gestureFunctionRouter();
    speechToTextStore.startListening();
  }

  @action
  breathingPentagonsHoldEndCallback() {
    widgetStore.breathingPentagonsStore.gestureFunctionRouter();
    speechToTextStore.stopListening();
    onSpeechResultStore.currentPhraseIndex++;
    validateQueryStore.validateTheLength(
      inputString: widgetStore.smartFadingAnimatedTextStore.currentMainText,
    );
  }

  @override
  List<Object> get props => [];
}
