// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/main.dart';
import 'package:simple_animations/simple_animations.dart';

part 'home_screen_coordinator_store.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends Equatable with Store {
  final PortalAPI portalAPI;
  final SwipeDetector swipe;
  final GesturePillStore gesturePillStore;
  final BeachWavesTrackerStore beachWaves;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    required this.swipe,
    required this.portalAPI,
    required this.gesturePillStore,
    required this.beachWaves,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  });

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
    holdListener();
    gestureListener();

    await portalAPI.setupTheStream();

    // reaction((p0) => portalAPI.currentQuadrant, (p0) {

    //   print("quadrant api home coordinator $p0");
    // });

    // await portalAPI.setupTheStream(
    //     startingQuadrant: 0,
    //     numberOfQuadrants: 0,
    //     totalAngleCoverageOfEachQuadrant: 0);

    // reaction((p0) => portalAPI.drawingMode, (p0) { })
    // ^^ idk figure this out later
  }

  beachWavesListener() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (beachWaves.movieStatus == MovieStatus.finished) {
          Modular.to.navigate('/p2p_collaborator_pool/');
          // Modular.to.navigate('/p2p_perspective_session/');
        }
      });

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
          // fadeTheTextOutAndWaterComesDown();
          default:
            break;
        }
      });
  holdListener() => reaction((p0) => swipe.holdCount, (p0) {
        fadeTheTextOutAndWaterComesDown();
      });

  fadeTheTextOutAndWaterComesDown() {
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
