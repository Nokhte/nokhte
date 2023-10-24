// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/api/portal_api.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/api/quadrant_api.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/main.dart';

// * Mobx Codegen Inclusion
part 'home_screen_coordinator_store.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends Equatable with Store {
  // final PortalAPI portalAPI;
  final QuadrantAPI quadrantAPI;
  final GesturePillStore gesturePillStore;
  final BeachWavesTrackerStore beachWaves;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    // required this.portalAPI,
    required this.quadrantAPI,
    required this.gesturePillStore,
    required this.beachWaves,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  }) {
    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished) {
        Modular.to.navigate('/p2p_collaborator_pool/');
      }
    });
  }

  homeScreenConstructorCallback() async {
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

    // api setup

    await quadrantAPI.setupTheStream(
      numberOfQuadrants: 6,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.indexNegativeQuadrants,
    );

    reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
      print("quadrant api home coordinator $p0");
    });

    // await portalAPI.setupTheStream(
    //     startingQuadrant: 0,
    //     numberOfQuadrants: 0,
    //     totalAngleCoverageOfEachQuadrant: 0);

    // reaction((p0) => portalAPI.drawingMode, (p0) { })
    // ^^ idk figure this out later
  }

  homeScreenSwipeUpCallback() {
    // works!!
    Modular.to.navigate('/p2p_purpose_session/');
  }

  // homeScreenSwipeUpCallback() {
  //   if (!fadingTextStateTrackerStore.isPaused) {
  //     fadingTextStateTrackerStore.togglePause();
  //   }
  //   if (beachWaves.movieStatus != MovieStatus.inProgress) {
  //     gesturePillStore.startTheAnimation();
  //     fadingTextStateTrackerStore.currentMainText = "";
  //     fadingTextStateTrackerStore.currentSubText = "";
  //     beachWaves.teeUpOceanDive();
  //     beachWaves.teeOceanDiveMovieUp(
  //       startingWaterMovement: beachWaves.passingParam,
  //     );
  //   }
  // }

  @override
  List<Object> get props => [
// some items
      ];
}
