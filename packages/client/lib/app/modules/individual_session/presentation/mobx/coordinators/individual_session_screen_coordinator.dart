// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/swipe/stack/presentation/presentation.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';
import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
part 'individual_session_screen_coordinator.g.dart';

class IndividualSessionScreenCoordinatorStore = _IndividualSessionScreenCoordinatorStoreBase
    with _$IndividualSessionScreenCoordinatorStore;

abstract class _IndividualSessionScreenCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final CreateIndividualSessionStore createIndividualSession;
  final ChangePerspectivesAudioRecordingStatusStore setRecordingStatus;
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final ChangeAudioPlayingStatusStore changeAudioPlayingStatus;
  final UpdateSessionMetadataStore updateSessionMetadata;
  final UploadIndividualPerspectivesAudioStore
      uploadIndividualPerspectivesAudio;
  final SwipeDetector swipe;
  final IndividualSessionScreenWidgetsCoordinator widgets;

  _IndividualSessionScreenCoordinatorStoreBase({
    required this.changeAudioPlayingStatus,
    required this.setRecordingStatus,
    required this.createIndividualSession,
    required this.updateSessionMetadata,
    required this.uploadIndividualPerspectivesAudio,
    required super.quadrantAPI,
    required this.getCurrentPerspectives,
    required this.swipe,
    required this.widgets,
  });

  final quadNum = 5;
  final quadSpread = 90;

  @computed
  String get currentPerspective =>
      getCurrentPerspectives.currentPerspectives[chosenIndex] ?? '';

  @observable
  bool hasAlreadyMadeTheGesture = false;

  @action
  toggleHasAlreadyMadeGesture() =>
      hasAlreadyMadeTheGesture = !hasAlreadyMadeTheGesture;

  @observable
  IndividualSessionScreenType screenType =
      IndividualSessionScreenType.perspectiveViewingMode;

  @observable
  bool hasntRecordedForAudioIndex = true;

  @observable
  String currentPath = '';

  @observable
  String formattedPerspective = '';

  @observable
  String fileName = '';

  @observable
  ObservableList<String> thePerspectives = ObservableList.of([]);

  @observable
  ObservableList<int> numberOfFiles = ObservableList.of([]);

  @action
  screenConstructor() async {
    widgets.setupWaterImmersion();
    widgets.attuneTheWidgets(DateTime.now());

    await getCurrentPerspectives(NoParams());
    thePerspectives = ObservableList.of(
      List.filled(getCurrentPerspectives.currentPerspectives.length, ""),
    );

    numberOfFiles = ObservableList.of(
      List.filled(getCurrentPerspectives.currentPerspectives.length, 1),
    );

    widgets.setText(getCurrentPerspectives.currentPerspectives[chosenIndex]);
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    quadrantAPIListener();
    gestureListener();
    holdingStateListener();
    await createIndividualSession(NoParams());
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }
  }

  quadrantAPIListener() => reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
        if (p0 >= 0) {
          valueTrackingSetup(p0);
          perspectivesController();
        }
      });
  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            if (!swipe.hasAlreadyMadeGesture) {
              switch (screenType) {
                case IndividualSessionScreenType.perspectiveViewingMode:
                  transitionToRecordingMode();
                case IndividualSessionScreenType.recordingAudioMode:
                  transitionToPerspectivesMode();
              }
            }
          case GestureDirections.down:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              startRecordingAudioClip();
            }
          case GestureDirections.left:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              audioPlatformIndexMarkDown();
            }
          case GestureDirections.right:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              audioPlatformIndexMarkUp();
            }
          default:
            break;
        }
      });
  holdingStateListener() => reaction((p0) => swipe.holdState, (p0) {
        switch (p0) {
          case HoldState.initial:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              if (swipe.directionsType == GestureDirections.down) {
                stopRecordingAudioClip();
              }
            }
          default:
            break;
        }
      });

  perspectivesIndexMarkUp() {
    setChosenIndex(chosenIndex + 1);
    widgets.markUpPerspectivesMap(chosenIndex, currentPerspective);
    audioPlatformReset();
  }

  perspectivesIndexMarkDown() {
    setChosenIndex(chosenIndex - 1);
    widgets.markUpPerspectivesMap(chosenIndex, currentPerspective);
    audioPlatformReset();
  }

  @action
  audioPlatformIndexMarkUp() {
    numberOfFiles[chosenIndex]++;
    hasntRecordedForAudioIndex = true;
    widgets.markUpOrDownTheAudioPlatform(
      numberOfFiles[chosenIndex] - 1,
      shouldMoveUp: true,
    );
  }

  audioPlatformIndexMarkDown() {
    if (numberOfFiles[chosenIndex] == 0) return;
    numberOfFiles[chosenIndex]--;
    widgets.markUpOrDownTheAudioPlatform(
      numberOfFiles[chosenIndex] - 1,
      shouldMoveUp: false,
    );
  }

  @action
  audioPlatformReset() => widgets.resetAudioPlatform();

  @action
  startRecordingAudioClip() async {
    print("started recording");
    hasntRecordedForAudioIndex = false;
    formattedPerspective = StorageUtilities.getFormattedPerspective(
      currentIndex: chosenIndex,
      thePerspective: getCurrentPerspectives.currentPerspectives[chosenIndex],
    );

    fileName = StorageUtilities.getFileName(
      numberOfFiles[chosenIndex],
      getCurrentPerspectives.theUsersUID,
    );
    currentPath = fileName;
    await setRecordingStatus(
      ChangePerspectivesAudioRecordingStatusParams(
        recordingAction: PerspectivesAudioRecordingActions.startRecording,
        thePath: currentPath,
      ),
    );
    widgets.setupWaterImmersion();
    widgets.startWaterImmersion();
  }

  @action
  playTheAudio() async => await changeAudioPlayingStatus(
      ChangeAudioPlayingStatusParams(path: currentPath, startPlaying: true));

  @action
  stopPlayingTheAudio() async => await changeAudioPlayingStatus(
      ChangeAudioPlayingStatusParams(path: currentPath, startPlaying: false));

  @action
  stopRecordingAudioClip() async {
    print("ended recording");
    await setRecordingStatus(
      ChangePerspectivesAudioRecordingStatusParams(
        recordingAction: PerspectivesAudioRecordingActions.stopRecording,
        thePath: currentPath,
      ),
    );
    final file = setRecordingStatus.returnFile;

    await updateSessionMetadata(
      UpdateSessionMetadataParams(
        sessionMetadata: SessionMetadata(
          numberOfFiles: numberOfFiles,
          thePerspectives: thePerspectives,
        ),
      ),
    );
    final IndividualSessionAudioClip clipData = IndividualSessionAudioClip(
      isOverwritingAnotherFile: hasntRecordedForAudioIndex ? false : true,
      thePerspective: getCurrentPerspectives.currentPerspectives[chosenIndex],
      totalNumberOfFilesForThePerspective: numberOfFiles[chosenIndex],
      thePerspectivesIndex: chosenIndex,
      thePerspectivesTimestamp:
          getCurrentPerspectives.currentPerspectivesTimestamp,
      theSessionTimestamp: createIndividualSession.sessionTimestamp,
      theFile: file,
    );
    await uploadIndividualPerspectivesAudio(
        UploadIndividualPerspectivesAudioParams(clipData: clipData));
    widgets.audioRecordingWater.initImmersionBackToHorizon();
  }

  perspectivesController() {
    if (isSecondTime && firstValue > 0) {
      perspectivesIndexMarkUp();
    } else if (!isFirstTime && !isSecondTime && secondValue > firstValue) {
      perspectivesIndexMarkUp();
    } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
      perspectivesIndexMarkDown();
    }
  }

  @action
  transitionToRecordingMode() {
    screenType = IndividualSessionScreenType.recordingAudioMode;
    widgets.transitionToRecordingMode();
    swipe.toggleHasAlreadyMadeGesture();
  }

  @action
  transitionToPerspectivesMode() {
    screenType = IndividualSessionScreenType.perspectiveViewingMode;
    widgets.transitionBackToPerspectivesMode();
    swipe.toggleHasAlreadyMadeGesture();
  }

  @override
  List<Object> get props => [];
}
