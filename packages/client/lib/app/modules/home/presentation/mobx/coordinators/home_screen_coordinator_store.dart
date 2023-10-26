// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
// import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/main.dart';
// import 'package:add_2_calendar/add_2_calendar.dart';

// * Mobx Codegen Inclusion
part 'home_screen_coordinator_store.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends Equatable with Store {
  final PortalAPI portalAPI;
  // final QuadrantAPI quadrantAPI;
  final GesturePillStore gesturePillStore;
  final BeachWavesTrackerStore beachWaves;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    required this.portalAPI,
    // required this.quadrantAPI,
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

  homeScreenSwipeUpCallback() async {
    // works!!
    Modular.to.navigate('/p2p_purpose_session/');
    // final Event event = Event(
    //   title: 'Perspectives Session with \${PERSON}',
    //   // description: 'With X Persion',
    //   // location: 'Event location',
    //   startDate: DateTime(2023, 10, 28),
    //   endDate: DateTime(2023, 10, 28),
    //   iosParams: const IOSParams(
    //     reminder: Duration(
    //       hours: 1,
    //     ), // on iOS, you can set alarm notification after your event.
    //     url: 'com.nokhte.nokhte', // on iOS, you can set url to your event.
    //   ),
    //   androidParams: const AndroidParams(
    //     emailInvites: [], // on Android, you can add invite emails to your event.
    //   ),
    // );
    // Add2Calendar.addEvent2Cal(event);
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
