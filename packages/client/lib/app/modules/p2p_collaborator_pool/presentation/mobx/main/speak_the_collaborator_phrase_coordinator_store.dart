// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/types/validation_enum.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/types/gestures.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/validate_query.dart';
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
  final EnterCollaboratorPoolStore enterCollaboratorPoolStore;

  @observable
  bool isReadyToEnterPool = false;

  _SpeakTheCollaboratorPhraseCoordinatorStoreBase({
    required this.widgetStore,
    required this.speechToTextStore,
    required this.onSpeechResultStore,
    required this.validateQueryStore,
    required this.enterCollaboratorPoolStore,
  }) {
    reaction((p0) => onSpeechResultStore.currentPhraseIndex, (p0) {
      widgetStore.smartFadingAnimatedTextStore
          .togglePause(gestureType: Gestures.none);
      widgetStore.smartFadingAnimatedTextStore.addNewMessage(
        mainMessage: onSpeechResultStore.currentSpeechResult,
      );
      validateQueryStore.validateTheLength(
        inputString: onSpeechResultStore.currentSpeechResult,
      );
    });
    reaction((p0) => validateQueryStore.isProperLength, (p0) {
      if (validateQueryStore.isProperLength == ValidationStatus.invalid) {
        widgetStore.smartFadingAnimatedTextStore.changeFutureSubMessage(
          amountOfMessagesForward:
              onSpeechResultStore.currentPhraseIndex == 1 ? 2 : 1,
          message: "invalid length collaborator phrase",
        );
      } else if (validateQueryStore.isProperLength == ValidationStatus.valid) {
        validateQueryStore.call(
          ValidateQueryParams(
            query: onSpeechResultStore.currentSpeechResult,
          ),
        );
      }
    });
    reaction((p0) => validateQueryStore.isValidated, (p0) {
      if (validateQueryStore.isValidated == ValidationStatus.valid &&
          validateQueryStore.isProperLength == ValidationStatus.valid) {
        widgetStore.smartFadingAnimatedTextStore.changeFutureSubMessage(
          amountOfMessagesForward:
              onSpeechResultStore.currentPhraseIndex == 1 ? 2 : 1,
          message: "Swipe Up To Enter",
        );
      } else if (validateQueryStore.isValidated == ValidationStatus.invalid &&
          validateQueryStore.isProperLength == ValidationStatus.valid) {
        widgetStore.smartFadingAnimatedTextStore.changeFutureSubMessage(
          amountOfMessagesForward:
              onSpeechResultStore.currentPhraseIndex == 1 ? 2 : 1,
          message: "invalid collaborator phrase",
        );
      }
    });
  }

  @action
  breathingPentagonsHoldStartCallback() {
    validateQueryStore.resetCheckerFields();
    widgetStore.breathingPentagonsStore.gestureFunctionRouter();
    speechToTextStore.startListening();
  }

  @action
  breathingPentagonsHoldEndCallback() {
    widgetStore.breathingPentagonsStore.gestureFunctionRouter();
    speechToTextStore.stopListening();
    onSpeechResultStore.currentPhraseIndex++;
  }

  @action
  collaboratorPhraseSwipeDownCallback() {
    widgetStore.backToShoreWidgetChanges();
  }

  @action
  speakTheCollaboratorPhraseSwipeUpCallback() {
    if (validateQueryStore.isValidated == ValidationStatus.valid) {
      enterCollaboratorPoolStore(validateQueryStore.phraseIDs);
      isReadyToEnterPool = true;
    }
  }

  speakTheCollaboratorPhraseScreenConstructorCallback({
    required SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore,
    required double startingWaveMovement,
  }) {
    coordinatorStore.speechToTextStore.initSpeech();
    coordinatorStore.widgetStore.beachWavesStore
        .teeOceanDiveMovieUp(startingWaterMovement: startingWaveMovement);
  }

  @override
  List<Object> get props => [];
}
