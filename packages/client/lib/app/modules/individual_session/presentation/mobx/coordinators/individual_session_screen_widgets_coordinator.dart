// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_widgets_coordinator.g.dart';

class IndividualSessionScreenWidgetsCoordinator = _IndividualSessionScreenWidgetsCoordinatorBase
    with _$IndividualSessionScreenWidgetsCoordinator;

abstract class _IndividualSessionScreenWidgetsCoordinatorBase
    extends BasePerspectivesWidgetsStore with Store {
  _IndividualSessionScreenWidgetsCoordinatorBase({
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  });

  textChangeAndFadeIn(String newText) => Future.delayed(Seconds.get(2), () {
        setText(newText);
        collaborativeTextEditor.toggleWidgetVisibility();
      });

  markup(int chosenIndex, String currentPerspective) {
    moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: true);
    textChangeAndFadeIn(currentPerspective);
  }

  onSwipeUp() {
    Future.delayed(
        Seconds.get(1), () => beachSky.control = Control.playReverseFromEnd);
    beachHorizonWater.fullSkyBackToShorePreReq(currentTime: DateTime.now());
    collaborativeTextEditor.toggleWidgetVisibility();
    perspectivesMap.toggleWidgetVisibility();
  }
}
