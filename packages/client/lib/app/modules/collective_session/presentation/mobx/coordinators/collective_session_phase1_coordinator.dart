// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/main/main.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/main/add_individual_session_metadata_to_collective_session_store.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/collective_session/types/types.dart';
part 'collective_session_phase1_coordinator.g.dart';

class CollectiveSessionPhase1Coordinator = _CollectiveSessionPhase1CoordinatorBase
    with _$CollectiveSessionPhase1Coordinator;

abstract class _CollectiveSessionPhase1CoordinatorBase
    extends BaseQuadrantAPIReceiver with Store {
  final VoiceCallActionsStore voiceCallActions;
  final InstantiateAgoraSdkStore instantiateAgoraSdk;
  final GetAgoraTokenStore getAgoraToken;
  final GetChannelIdStore getChannelId;
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final CollectiveSessionPhase1WidgetsCoordinator widgets;
  final ChangeAudioPlayingStatusStore audioPlayer;
  final SwipeDetector swipe;
  final TapDetector tap;
  final MoveIndividualPerspectivesAudioToCollectiveSpaceStore moveTheAudio;
  final GetCollaboratorPerspectivesStore getCollaboratorPerspectivesAudio;
  final AddIndividualSessionMetadataToCollectiveSessionStore
      addIndividualMetadata;
  final CreateCollectiveSessionStore createCollectiveSession;

  final quadNum = 5;
  final quadSpread = 90;

  _CollectiveSessionPhase1CoordinatorBase({
    required super.quadrantAPI,
    required this.addIndividualMetadata,
    required this.getChannelId,
    required this.voiceCallActions,
    required this.instantiateAgoraSdk,
    required this.getAgoraToken,
    required this.createCollectiveSession,
    required this.getCurrentPerspectives,
    required this.swipe,
    required this.audioPlayer,
    required this.getCollaboratorPerspectivesAudio,
    required this.moveTheAudio,
    required this.tap,
    required this.widgets,
  });

  @observable
  bool isReadyToMoveToNextPart = false;

  @observable
  int chosenAudioIndex = 0;

  @observable
  ObservableStream onCompletedStream = ObservableStream(const Stream.empty());

  @observable
  bool isPlaying = false;

  @action
  screenConstructor() async {
    onCompletedStream = ObservableStream(
        audioPlayer.getPlayerCompletionStream(NoParams()).stream);
    onCompletedStream.listen((value) {
      checkIfTheyHaveListenedToAllTheClips();
      isPlaying = false;
    });
    widgets.attuneTheWidgets(DateTime.now());
    await getCurrentPerspectives(NoParams());
    widgets.setText(getCurrentPerspectives.currentPerspectives[chosenIndex]);
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    await instantiateAgoraSdk(NoParams());
    await getChannelId(NoParams());
    await getAgoraToken(
      GetAgoraTokenParams(
        channelName: getChannelId.channelId,
      ),
    );
    await voiceCallActions.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: getAgoraToken.token,
          channelId: getChannelId.channelId,
        ),
      ),
    );
    await voiceCallActions.muteOrUnmuteAudio(wantToMute: false);

    await createCollectiveSession(NoParams());
    await addIndividualMetadata(NoParams());

    Future.delayed(
        Seconds.get(3),
        () async => await getCollaboratorPerspectivesAudio(
              NoParams(),
            ));
    quadrantAPIListener();
    gestureListener();
    tapListener();
    readyToMoveOnListener();

    Future.delayed(Seconds.get(12), () => moveToNextScreen());
    //
  }

  quadrantAPIListener() => reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
        valueTrackingSetup(p0);
        perspectivesController();
        // perspectives
      });

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            if (!swipe.hasAlreadyMadeGesture) {
              switch (screenType) {
                case CollectiveSessionPhase1ScreenTypes.perspectiveViewingMode:
                  transitionToListeningMode();
                case CollectiveSessionPhase1ScreenTypes.listenToTheirClips:
                  transitionToPerspectivesMode();
              }
            }
          case GestureDirections.left:
            if (screenType ==
                CollectiveSessionPhase1ScreenTypes.listenToTheirClips) {
              audioPlatformIndexMarkdown();
            }
          case GestureDirections.right:
            if (screenType ==
                CollectiveSessionPhase1ScreenTypes.listenToTheirClips) {
              audioPlatformIndexMarkup();
            }
          default:
            break;
        }
      });
  tapListener() => reaction((p0) => tap.tapCount, (p0) {
        if (screenType ==
            CollectiveSessionPhase1ScreenTypes.listenToTheirClips) {
          audioPlayer.isPlaying ? stopAudio() : playAudio();
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

  @observable
  CollectiveSessionPhase1ScreenTypes screenType =
      CollectiveSessionPhase1ScreenTypes.perspectiveViewingMode;

  @action
  audioPlatformReset() => widgets.resetAudioPlatform();

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
  transitionToListeningMode() {
    screenType = CollectiveSessionPhase1ScreenTypes.listenToTheirClips;
    widgets.transitionToListeningMode(hadAudioClipsForThePerspective);
    swipe.toggleHasAlreadyMadeGesture();
  }

  @action
  transitionToPerspectivesMode() {
    screenType = CollectiveSessionPhase1ScreenTypes.perspectiveViewingMode;
    widgets.transitionBackToPerspectivesMode(hadAudioClipsForThePerspective);
    swipe.toggleHasAlreadyMadeGesture();
  }

  @action
  audioPlatformIndexMarkup() {
    // check if it is LEQ than the max number before doing it
    chosenAudioIndex++;
    widgets.markUpOrDownTheAudioPlatform(chosenAudioIndex, shouldMoveUp: true);
  }

  @action
  audioPlatformIndexMarkdown() {
    // check if it's GEQ 0 before doing it
    chosenAudioIndex--;
    widgets.markUpOrDownTheAudioPlatform(chosenAudioIndex, shouldMoveUp: false);
  }

  @action
  playAudio() {
    isPlaying = true;

    getCollaboratorPerspectivesAudio
        .collaboratorPerspectives
        .collaboratorPerspectivesData[chosenIndex]
        .numberOfFilesTheyHaveListenedTo = chosenAudioIndex + 1;
    audioPlayer(ChangeAudioPlayingStatusParams(
        path: getCollaboratorPerspectivesAudio
            .collaboratorPerspectives
            .collaboratorPerspectivesData[chosenIndex]
            .pathsToFiles[chosenAudioIndex],
        startPlaying: true));
  }

  @action
  stopAudio() {
    isPlaying = false;
    audioPlayer(ChangeAudioPlayingStatusParams(
        path: getCollaboratorPerspectivesAudio
            .collaboratorPerspectives
            .collaboratorPerspectivesData[chosenIndex]
            .pathsToFiles[chosenAudioIndex],
        startPlaying: false));
  }

  @action
  checkIfTheyHaveListenedToAllTheClips() {
    List<bool> checkVals = [];
    bool returnVal = true;

    for (final clipData in getCollaboratorPerspectivesAudio
        .collaboratorPerspectives.collaboratorPerspectivesData) {
      if (clipData.numberOfFilesTheyHaveListenedTo + 1 >=
          clipData.numberOfFiles) {
        // print(
        //     "${clipData.numberOfFilesTheyHaveListenedTo} ${clipData.numberOfFiles}");
        checkVals.add(true);
      } else {
        checkVals.add(false);
      }
    }
    for (final checkVal in checkVals) {
      if (checkVal == false) {
        returnVal = false;
      }
    }
    // print("Hey return val?? $checkVals $returnVal");
    isReadyToMoveToNextPart = returnVal;
  }

  readyToMoveOnListener() => reaction((p0) => isReadyToMoveToNextPart, (p0) {
        if (p0) {
          moveToNextScreen();
          // print("YOU ARE READY TO MOVE ON CONGRATS!!");
        }
      });

  moveToNextScreen() {
    Future.delayed(
        Seconds.get(3), () => transitionToListeningMode()); // take out of prod
    Future.delayed(Seconds.get(6), () => transitionToPerspectivesMode());
    Future.delayed(
      Seconds.get(9),
      () => widgets.transitionBackToShore(),
    );
  }

  @computed
  bool get hadAudioClipsForThePerspective =>
      (getCollaboratorPerspectivesAudio.collaboratorPerspectives
          .collaboratorPerspectivesData[chosenIndex].numberOfFiles) >
      0;

  @computed
  String get currentPerspective =>
      getCurrentPerspectives.currentPerspectives[chosenIndex] ?? '';
}
