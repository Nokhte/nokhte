// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/main/main.dart';

import 'widget_coordinator_store.dart';
part 'speak_the_collaborator_phrase_coordinator_store.g.dart';

class SpeakTheCollaboratorPhraseCoordinatorStore = _SpeakTheCollaboratorPhraseCoordinatorStoreBase
    with _$SpeakTheCollaboratorPhraseCoordinatorStore;

abstract class _SpeakTheCollaboratorPhraseCoordinatorStoreBase extends Equatable
    with Store {
  final WidgetCoordinatorStore widgetStore;
  final LocalSpeechToTextCoordinator localSpeechToText;

  final SwipeDetector swipe;
  final HoldDetector hold;
  final OnSpeechResultStore onSpeechResultStore;
  final ValidateQueryStore validateQueryStore;
  final EnterCollaboratorPoolStore enterCollaboratorPoolStore;

  late BeachWavesTrackerStore beachWaves;
  late SmartFadingAnimatedTextTrackerStore fadingTextStore;
  late MeshCircleButtonStore meshCircleStore;
  late ExplanationTextStore explanationText;
  late NewBeachWavesStore newBeachWaves;

  _SpeakTheCollaboratorPhraseCoordinatorStoreBase({
    required this.swipe,
    required this.hold,
    required this.widgetStore,
    required this.localSpeechToText,
    required this.onSpeechResultStore,
    required this.validateQueryStore,
    required this.enterCollaboratorPoolStore,
  })  : beachWaves = widgetStore.beachWavesStore,
        fadingTextStore = widgetStore.fadingText,
        meshCircleStore = widgetStore.meshCircleButtonStore,
        explanationText = widgetStore.explanationText,
        newBeachWaves = widgetStore.newBeachWaves;

  delayedNavigation(Function callback) {
    Future.delayed(
      beachWaves.movie.duration,
      () => callback(),
    );
  }

  errorVibration() => Future.delayed(
        Seconds.get(3),
        () async => await Vibration.vibrate(
            pattern: [500, 500], intensities: [255, 255]),
      );

  @action
  screenConstructor() async {
    widgetStore.widgetConstructor();
    await localSpeechToText.initLeopardStore(NoParams());
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }
    gestureListener();
    queryValidationLengthListener();
    queryContentValidationListener();
    speechToTextListener();
    beachWavesMovieStatusListener();
    holdListener();
    holdLetGoListener();
  }

  @observable
  bool isFirstTimeSpeaking = true;

  beachWavesMovieStatusListener() =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) {
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.backToOceanDive) {
          Modular.to.navigate('/p2p_collaborator_pool/');
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.oceanDiveToTimesUp) {
          Modular.to.navigate('/p2p_collaborator_pool/pool/');
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.oceanDiveToOnShore) {
          Modular.to.navigate('/home/');
        }
      });

  speechToTextListener() =>
      reaction((p0) => onSpeechResultStore.currentPhraseIndex, (p0) {
        fadingTextStore.togglePause(gestureType: Gestures.none);
        fadingTextStore.addNewMessage(
          mainMessage: onSpeechResultStore.currentSpeechResult,
        );
        validateQueryStore.validateTheLength(
          inputString: onSpeechResultStore.currentSpeechResult,
        );
      });

  queryValidationLengthListener() =>
      reaction((p0) => validateQueryStore.isProperLength, (p0) async {
        if (validateQueryStore.isProperLength == ValidationStatus.invalid) {
          errorVibration();
        } else if (validateQueryStore.isProperLength ==
            ValidationStatus.valid) {
          validateQueryStore.call(
            ValidateQueryParams(
              query: onSpeechResultStore.currentSpeechResult,
            ),
          );
        }
      });

  queryContentValidationListener() =>
      reaction((p0) => validateQueryStore.isValidated, (p0) {
        if (validateQueryStore.isValidated == ValidationStatus.valid &&
            validateQueryStore.isProperLength == ValidationStatus.valid) {
          fadingTextStore.changeFutureSubMessage(
            amountOfMessagesForward: 1,
            message: "Swipe Up To Enter",
          );
        } else if (validateQueryStore.isValidated == ValidationStatus.invalid &&
            validateQueryStore.isProperLength == ValidationStatus.valid) {
          errorVibration();
        }
      });

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            enterThePool();
          case GestureDirections.down:
            goBackToShore();
          default:
            break;
        }
      });

  holdListener() => reaction(
        (p0) => hold.holdCount,
        (p0) async {
          if (isFirstTimeSpeaking) {
            Future.delayed(
              Seconds.get(3),
              () => explanationText.toggleWidgetVisibility(),
            );
            isFirstTimeSpeaking = false;
          }
          await Haptics.vibrate(HapticsType.medium);
          await audioButtonHoldStartCallback();
          meshCircleStore.initGlowUp();
        },
      );

  holdLetGoListener() => reaction(
        (p0) => hold.letGoCount,
        (p0) async {
          await Haptics.vibrate(HapticsType.medium);
          await audioButtonHoldEndCallback();
          meshCircleStore.initGlowDown();
        },
      );

  @observable
  bool isReadyToEnterPool = false;

  @action
  audioButtonHoldStartCallback() async {
    await validateQueryStore.resetCheckerFields();
    meshCircleStore.toggleColorAnimation();
    await localSpeechToText.startRecordingStore(NoParams());
  }

  @action
  audioButtonHoldEndCallback() async {
    meshCircleStore.toggleColorAnimation();
    await localSpeechToText.stopRecordingStore(NoParams()).then((value) {
      onSpeechResultStore
          .addSpeechResult(localSpeechToText.stopRecordingStore.resultingWords);
      onSpeechResultStore.currentPhraseIndex++;
    });
  }

  @action
  goBackToShore() {
    widgetStore.backToShoreWidgetChanges();
  }

  @action
  enterThePool() {
    if (validateQueryStore.isValidated == ValidationStatus.valid) {
      enterCollaboratorPoolStore(validateQueryStore.phraseIDs);
      enterCollaboratorPoolStore(validateQueryStore.phraseIDs);
      print("did this run??");
      widgetStore.transitionToTimesUp();
      // widgetStore.toTheDepthsWidgetChanges();
    }
  }

  @override
  List<Object> get props => [];
}
