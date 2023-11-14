// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
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
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final CollectiveSessionPhase1WidgetsCoordinator widgets;
  final ChangeAudioPlayingStatusStore audioPlayer;
  final SwipeDetector swipe;
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
    required this.createCollectiveSession,
    required this.getCurrentPerspectives,
    required this.swipe,
    required this.audioPlayer,
    required this.getCollaboratorPerspectivesAudio,
    required this.moveTheAudio,
    required this.widgets,
  });

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets(DateTime.now());
    await getCurrentPerspectives(NoParams());
    widgets.setText(getCurrentPerspectives.currentPerspectives[chosenIndex]);
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    // they have to more
    await createCollectiveSession(NoParams());
    await addIndividualMetadata(NoParams());
    // await moveTheAudio(NoParams());

    Future.delayed(
        Seconds.get(3),
        () async => await getCollaboratorPerspectivesAudio(
              NoParams(),
            ));
    quadrantAPIListener();
    gestureListener();
    tapListener();
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
  tapListener() => reaction((p0) => swipe.tapCount, (p0) {
        if (screenType ==
            CollectiveSessionPhase1ScreenTypes.listenToTheirClips) {
          // toggle pause and start for audio
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

  // @action
  // audioPlatformIndexMarkUp() {
  //   numberOfFiles[chosenIndex]++;
  //   hasntRecordedForAudioIndex = true;
  //   widgets.markUpOrDownTheAudioPlatform(
  //     numberOfFiles[chosenIndex] - 1,
  //     shouldMoveUp: true,
  //   );
  // }

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
    widgets.transitionToListeningMode();
    swipe.toggleHasAlreadyMadeGesture();
  }

  @action
  transitionToPerspectivesMode() {
    screenType = CollectiveSessionPhase1ScreenTypes.perspectiveViewingMode;
    widgets.transitionBackToPerspectivesMode();
    swipe.toggleHasAlreadyMadeGesture();
  }

  @action
  audioPlatformIndexMarkup() {
    // widgets.markUpOrDownTheAudioPlatform(chosenAudioIndex, shouldMoveUp: shouldMoveUp)
  }

  @action
  audioPlatformIndexMarkdown() {
    // widgets.markUpOrDownTheAudioPlatform(chosenAudioIndex, shouldMoveUp: shouldMoveUp)
  }

  @computed
  String get currentPerspective =>
      getCurrentPerspectives.currentPerspectives[chosenIndex] ?? '';
}
