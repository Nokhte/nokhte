// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_coordinator.g.dart';

class IndividualSessionScreenCoordinatorStore = _IndividualSessionScreenCoordinatorStoreBase
    with _$IndividualSessionScreenCoordinatorStore;

abstract class _IndividualSessionScreenCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final GetCurrentPerspectivesStore getCurrentPerspectives;
  final IndividualSessionScreenWidgetsCoordinator widgets;

  _IndividualSessionScreenCoordinatorStoreBase({
    required super.quadrantAPI,
    required this.getCurrentPerspectives,
    required this.widgets,
  });

  // make this dynamic later
  final quadNum = 5;
  final quadSpread = 90;

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
  }

  quadrantAPIListener() => reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
        if (p0 >= 0) {
          valueTrackingSetup(p0);
          // print("quad api listener $localPerspectives");
          perspectivesController();
        }
      });

  textChangeAndFadeIn() => Future.delayed(Seconds.get(2), () {
        widgets
            .setText(getCurrentPerspectives.currentPerspectives[chosenIndex]);
        widgets.collaborativeTextEditor.toggleWidgetVisibility();
      });

  markUp() {
    setChosenIndex(chosenIndex + 1);
    widgets.moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: true);
    textChangeAndFadeIn();
  }

  markDown() {
    setChosenIndex(chosenIndex - 1);
    widgets.moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: false);
    textChangeAndFadeIn();
  }

  perspectivesController() {
    if (isSecondTime && firstValue > 0) {
      markUp();
    } else if (!isFirstTime && !isSecondTime && secondValue > firstValue) {
      markUp();
    } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
      markDown();
    }
  }

  @action
  onSwipeUp() {
    //
  }

  @action
  onSwipeDown() {
    //
  }

  @override
  List<Object> get props => [];
}
