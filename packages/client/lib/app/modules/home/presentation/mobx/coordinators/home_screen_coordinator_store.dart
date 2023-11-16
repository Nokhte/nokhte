// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/main.dart';
import 'package:nokhte/app/modules/home/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

part 'home_screen_coordinator_store.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends Equatable with Store {
  final PortalAPI portalAPI;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final GesturePillStore gesturePillStore;
  final BeachWavesTrackerStore beachWaves;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    required this.getExistingCollaborationInfo,
    required this.swipe,
    required this.hold,
    required this.portalAPI,
    required this.gesturePillStore,
    required this.beachWaves,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  });

  @observable
  PlacesYouCanGo thePlaceTheyAreGoing = PlacesYouCanGo.initial;

  homeScreenConstructorCallback() async {
    beachWavesListener();
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ], secondGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ]));

    Future.delayed(Seconds.get(1), () async {
      await addNameToDatabaseStore(NoParams());
      await getCollaboratorPhraseStore(NoParams()).then((_) {
        fadingTextStateTrackerStore.setMainMessage(
          index: 2,
          thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
        );
      });
    });
    gestureListener();
    holdListener();
    await getExistingCollaborationInfo(NoParams());
    await portalAPI.setupTheStream();
    portalAPIListener();
  }

  @action
  portalAPIListener() => reaction((p0) => portalAPI.drawingMode, (p0) async {
        if (p0 == DrawingStatus.hasDrawn &&
            getExistingCollaborationInfo.hasDonePerspectives &&
            getExistingCollaborationInfo.hasCommittedAPurpose) {
          await Haptics.vibrate(HapticsType.medium);
          fadeTheTextOutAndWaterComesDown(PlacesYouCanGo.individualSession);
        }
      });

  beachWavesListener() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (beachWaves.movieStatus == MovieStatus.finished) {
          switch (thePlaceTheyAreGoing) {
            case PlacesYouCanGo.newCollaboration:
              Modular.to.navigate('/p2p_collaborator_pool/');
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

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            if (getExistingCollaborationInfo.hasCommittedAPurpose) {
              final thePlaceTheyAreGoing =
                  getExistingCollaborationInfo.hasDonePerspectives
                      ? PlacesYouCanGo.collectiveSession
                      : PlacesYouCanGo.perspectivesSession;
              fadeTheTextOutAndWaterComesDown(thePlaceTheyAreGoing);
            }
          default:
            break;
        }
      });
  holdListener() => reaction((p0) => hold.holdCount, (p0) async {
        await Haptics.vibrate(HapticsType.medium);
        fadeTheTextOutAndWaterComesDown(PlacesYouCanGo.newCollaboration);
      });

  @action
  fadeTheTextOutAndWaterComesDown(PlacesYouCanGo thePlaceTheyAreGoingParam) {
    thePlaceTheyAreGoing = thePlaceTheyAreGoingParam;
    if (!fadingTextStateTrackerStore.isPaused) {
      fadingTextStateTrackerStore.togglePause();
    }
    if (beachWaves.movieStatus != MovieStatus.inProgress) {
      gesturePillStore.setPillAnimationControl(Control.play);
      fadingTextStateTrackerStore.currentMainText = "";
      fadingTextStateTrackerStore.currentSubText = "";
      beachWaves.teeUpOceanDive();
      beachWaves.teeOceanDiveMovieUp(
        startingWaterMovement: beachWaves.passingParam,
      );
    }
  }

  @override
  List<Object> get props => [];
}
