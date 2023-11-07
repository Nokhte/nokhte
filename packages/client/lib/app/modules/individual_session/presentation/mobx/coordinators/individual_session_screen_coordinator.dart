// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/swipe/stack/presentation/presentation.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_coordinator.g.dart';

class IndividualSessionScreenCoordinatorStore = _IndividualSessionScreenCoordinatorStoreBase
    with _$IndividualSessionScreenCoordinatorStore;

abstract class _IndividualSessionScreenCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final SwipeDetector swipe;
  final IndividualSessionScreenWidgetsCoordinator widgets;

  _IndividualSessionScreenCoordinatorStoreBase({
    required super.quadrantAPI,
    required this.getCurrentPerspectives,
    required this.swipe,
    required this.widgets,
  });

  // make this dynamic later
  final quadNum = 5;
  final quadSpread = 90;

  @computed
  String get currentPerspective =>
      getCurrentPerspectives.currentPerspectives[chosenIndex] ?? '';

  @observable
  IndividualSessionScreenType screenType =
      IndividualSessionScreenType.perspectiveViewingMode;

  @observable
  int chosenAudioIndex = 0;

  @action
  setChosenAudioIndex(int newVal) => chosenAudioIndex = newVal;

  // what do we want to do now?

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
    quadrantAPIListener();
    gestureListener();
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
            switch (screenType) {
              case IndividualSessionScreenType.perspectiveViewingMode:
                transitionToRecordingMode();
                swipe.resetDirectionsType();
              case IndividualSessionScreenType.recordingAudioMode:
                transitionToPerspectivesMode();
                swipe.resetDirectionsType();
            }
          case GestureDirections.down:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              // here is where they record someting
              // print("DOWN on recording");
              swipe.resetDirectionsType();
            }
          case GestureDirections.left:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              print("LEFT on recording");
              // audioPlatformIndexMarkUp();
              audioPlatformIndexMarkDown();
              swipe.resetDirectionsType();
            }
          case GestureDirections.right:
            if (screenType == IndividualSessionScreenType.recordingAudioMode) {
              print("RIGHT on recording");
              audioPlatformIndexMarkUp();
              // audioPlatformIndexMarkDown();
              swipe.resetDirectionsType();
            }

          default:
            break;
        }
      });

  perspectivesIndexMarkUp() {
    setChosenIndex(chosenIndex + 1);
    widgets.markUpPerspectivesMap(chosenIndex, currentPerspective);
  }

  perspectivesIndexMarkDown() {
    setChosenIndex(chosenIndex - 1);
    widgets.markUpPerspectivesMap(chosenIndex, currentPerspective);
  }

  @action
  audioPlatformIndexMarkUp() {
    chosenAudioIndex++;
    widgets.markUpOrDownTheAudioPlatform(
      chosenAudioIndex,
      shouldMoveUp: true,
    );
  }

  audioPlatformIndexMarkDown() {
    if (chosenAudioIndex == 0) return;
    chosenAudioIndex--;
    widgets.markUpOrDownTheAudioPlatform(
      chosenAudioIndex,
      shouldMoveUp: false,
    );
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
  }

  @action
  transitionToPerspectivesMode() {
    screenType = IndividualSessionScreenType.perspectiveViewingMode;
    widgets.transitionBackToPerspectivesMode();
  }

  @override
  List<Object> get props => [];
}
