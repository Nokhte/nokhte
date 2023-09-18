// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
// import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:primala/app/core/widgets/mobx/all_custom_widgets_tracker_store.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/main.dart';
// * Mobx Codegen Inclusion
part 'speak_the_collaborator_phrase_coordinator_store.g.dart';

class SpeakTheCollaboratorPhraseCoordinatorStore = _SpeakTheCollaboratorPhraseCoordinatorStoreBase
    with _$SpeakTheCollaboratorPhraseCoordinatorStore;

abstract class _SpeakTheCollaboratorPhraseCoordinatorStoreBase extends Equatable
    with Store {
  final AllCustomWidgetsTrackerStore widgetStore;
  final LocalSpeechToTextCoordinatorStore localSpeechToText;
  // final SpeechToTextStore speechToTextStore;
  final OnSpeechResultStore onSpeechResultStore;
  final ValidateQueryStore validateQueryStore;
  final EnterCollaboratorPoolStore enterCollaboratorPoolStore;
  late BeachWavesTrackerStore beachWaves;
  late BreathingPentagonsStateTrackerStore breathingPentagonsStore;
  late SmartFadingAnimatedTextTrackerStore fadingTextStore;

  @observable
  bool isReadyToEnterPool = false;

  _SpeakTheCollaboratorPhraseCoordinatorStoreBase({
    required this.widgetStore,
    required this.localSpeechToText,
    required this.onSpeechResultStore,
    required this.validateQueryStore,
    required this.enterCollaboratorPoolStore,
  }) {
    beachWaves = widgetStore.beachWavesStore;
    fadingTextStore = widgetStore.smartFadingAnimatedTextStore;
    breathingPentagonsStore = widgetStore.breathingPentagonsStore;

    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == MovieModes.backToOceanDive) {
        Modular.to.navigate('/p2p_collaborator_pool/');
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == MovieModes.toTheDepths) {
        Modular.to.navigate('/p2p_collaborator_pool/pool/');
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == MovieModes.backToShore) {
        print("issssssssssssss dis running");
        Modular.to.navigate('/home/');
      }
    });
    reaction((p0) => onSpeechResultStore.currentPhraseIndex, (p0) {
      fadingTextStore.togglePause(gestureType: Gestures.none);
      fadingTextStore.addNewMessage(
        mainMessage: onSpeechResultStore.currentSpeechResult,
      );
      validateQueryStore.validateTheLength(
        inputString: onSpeechResultStore.currentSpeechResult,
      );
    });
    reaction((p0) => validateQueryStore.isProperLength, (p0) {
      if (validateQueryStore.isProperLength == ValidationStatus.invalid) {
        fadingTextStore.changeFutureSubMessage(
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
        fadingTextStore.changeFutureSubMessage(
          amountOfMessagesForward:
              onSpeechResultStore.currentPhraseIndex == 1 ? 2 : 1,
          message: "Swipe Up To Enter",
        );
      } else if (validateQueryStore.isValidated == ValidationStatus.invalid &&
          validateQueryStore.isProperLength == ValidationStatus.valid) {
        fadingTextStore.changeFutureSubMessage(
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
    breathingPentagonsStore.gestureFunctionRouter();
    localSpeechToText.startRecordingStore(NoParams());
  }

  @action
  breathingPentagonsHoldEndCallback() async {
    breathingPentagonsStore.gestureFunctionRouter();
    await localSpeechToText.stopRecordingStore(NoParams()).then((value) {
      onSpeechResultStore
          .addSpeechResult(localSpeechToText.stopRecordingStore.resultingWords);
      onSpeechResultStore.currentPhraseIndex++;
    });
  }

  @action
  swipeDownCallback() {
    widgetStore.backToShoreWidgetChanges();
  }

  @action
  swipeUpCallback() {
    if (validateQueryStore.isValidated == ValidationStatus.valid) {
      enterCollaboratorPoolStore(validateQueryStore.phraseIDs);
      enterCollaboratorPoolStore(validateQueryStore.phraseIDs);
      widgetStore.toTheDepthsWidgetChanges();
    }
  }

  screenConstructorCallback({
    required SpeakTheCollaboratorPhraseCoordinatorStore coordinatorStore,
  }) async {
    beachWaves.initiateSuspendedAtSea();
    localSpeechToText.initLeopardStore(NoParams());
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }
    if (!fadingTextStore.showText && !fadingTextStore.firstTime) {
      fadingTextStore.resetToDefault();
    }
  }

  @override
  List<Object> get props => [];
}
