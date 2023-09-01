// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/main.dart';

// * Mobx Codegen Inclusion
part 'home_screen_coordinator_store.g.dart';

class HomeScreenCoordinatorStore = _HomeScreenCoordinatorStoreBase
    with _$HomeScreenCoordinatorStore;

abstract class _HomeScreenCoordinatorStoreBase extends Equatable with Store {
  final BeachWavesTrackerStore beachWaveStateTrackerStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  _HomeScreenCoordinatorStoreBase({
    required this.beachWaveStateTrackerStore,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  });

  homeScreenConstructorCallback() {
    Future.delayed(const Duration(seconds: 1), () async {
      await addNameToDatabaseStore(NoParams());
      await getCollaboratorPhraseStore(NoParams()).then((_) {
        fadingTextStateTrackerStore.setMainMessage(
          index: 2,
          thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
        );
      });
    });
  }

  homeScreenSwipeUpCallback() {
    Modular.to.navigate('/p2p_purpose_session/');
  }

  // homeScreenSwipeUpCallback() {
  //   if (!fadingTextStateTrackerStore.isPaused) {
  //     fadingTextStateTrackerStore.togglePause(gestureType: Gestures.none);
  //   }
  //   fadingTextStateTrackerStore.currentMainText = "";
  //   fadingTextStateTrackerStore.currentSubText = "";
  //   beachWaveStateTrackerStore.teeUpOceanDive();
  //   beachWaveStateTrackerStore.teeOceanDiveMovieUp(
  //     startingWaterMovement: beachWaveStateTrackerStore.passingParam,
  //   );
  // }

  @override
  List<Object> get props => [
// some items
      ];
}
