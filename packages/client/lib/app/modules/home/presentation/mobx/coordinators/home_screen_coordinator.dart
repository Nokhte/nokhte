// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/main.dart';
import 'package:nokhte/app/modules/home/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

part 'home_screen_coordinator.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends BaseCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final GesturePillStore gesturePillStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartTextStore smartText;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    required this.beachWaves,
    required this.getExistingCollaborationInfo,
    required this.swipe,
    required this.hold,
    required this.gesturePillStore,
    required this.addNameToDatabaseStore,
    required this.smartText,
    required this.getCollaboratorPhraseStore,
  });

  @observable
  PlacesYouCanGo thePlaceTheyAreGoing = PlacesYouCanGo.initial;

  @action
  homeScreenConstructorCallback() async {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    beachWavesListener();
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ], secondGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ]));

    gestureListener();
    // holdListener();
    await getExistingCollaborationInfo(NoParams());
    Duration fadeInDuration;
    await addNameToDatabaseStore(NoParams());
    await getCollaboratorPhraseStore(NoParams());

    getExistingCollaborationInfo.hasACollaboration
        ? {
            fadeInDuration = Seconds.get(10),
            smartText.setMessagesData(
              MessagesData.hasACollaboratorHomeList,
            ),
            smartText.setMainMessage(
              index: 1,
              thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
            )
          }
        : {
            fadeInDuration = Seconds.get(3),
            smartText.setMessagesData(
              MessagesData.homeList,
            ),
            smartText.setMainMessage(
              index: 2,
              thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
            )
          };
    smartText.startRotatingText(fadeInDuration);
  }

  @observable
  bool isNavigating = false;

  @action
  toggleIsNavigating() => isNavigating = !isNavigating;

  beachWavesListener() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
          switch (thePlaceTheyAreGoing) {
            case PlacesYouCanGo.newCollaboration:
              Modular.to.navigate('/p2p_collaborator_pool/');
            // Modular.to.navigate('/p2p_purpose_session/');
            case PlacesYouCanGo.collectiveSession:
              Modular.to.navigate('/collective_session/');
            case PlacesYouCanGo.individualSession:
              Modular.to.navigate('/individual_session/');
            case PlacesYouCanGo.perspectivesSession:
              Modular.to.navigate('/p2p_perspective_session/');
            default:
              break;
          }
        }
      });

  @action
  gestureListener() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            PlacesYouCanGo thePlaceTheyAreGoing =
                PlacesYouCanGo.newCollaboration;
            if (getExistingCollaborationInfo.hasCommittedAPurpose) {
              thePlaceTheyAreGoing = PlacesYouCanGo.perspectivesSession;
            } else if (getExistingCollaborationInfo.hasDonePerspectives) {
              thePlaceTheyAreGoing = PlacesYouCanGo.collectiveSession;
            }
            fadeTheTextOutAndWaterComesDown(thePlaceTheyAreGoing);
            await Haptics.vibrate(HapticsType.medium);
          default:
            break;
        }
      });

  @action
  fadeTheTextOutAndWaterComesDown(PlacesYouCanGo thePlaceTheyAreGoingParam) {
    thePlaceTheyAreGoing = thePlaceTheyAreGoingParam;
    if (!smartText.isPaused) {
      smartText.togglePause();
    }
    if (beachWaves.movieStatus != MovieStatus.inProgress) {
      gesturePillStore.setPillAnimationControl(Control.play);
      smartText.currentMainText = "";
      smartText.currentSubText = "";
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDiveSetup);
    }
  }

  @override
  List<Object> get props => [];
}
