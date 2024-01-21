// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_docs/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/mobx.dart';
part 'purpose_session_phase2_coordinator.g.dart';

class PurposeSessionPhase2Coordinator = _PurposeSessionPhase2CoordinatorBase
    with _$PurposeSessionPhase2Coordinator;

abstract class _PurposeSessionPhase2CoordinatorBase extends BaseCoordinator
    with Store {
  final SwipeDetector swipe;
  final PurposeSessionPhase2WidgetsCoordinator widgets;
  final SoloDocsCoordinator soloDoc;

  _PurposeSessionPhase2CoordinatorBase({
    required this.widgets,
    required this.swipe,
    required this.soloDoc,
  });

  @observable
  bool canSwipeUp = false;

  @observable
  bool hasSwipedUp = false;

  @action
  constructor() async {
    widgets.constructor(
      onKeyboardDown: onKeyboardDown,
      onKeyboardUp: onKeyboardUp,
    );
    await soloDoc.create(SoloDocTypes.purpose);
    swipeReactor();
  }

  @action
  onKeyboardUp() {
    canSwipeUp = false;
  }

  @action
  onKeyboardDown() {
    if (widgets.isOverThreeWords) {
      canSwipeUp = true;
    }
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            if (canSwipeUp &&
                !hasSwipedUp &&
                widgets.hasCompletedIntroduction) {
              hasSwipedUp = true;
              canSwipeUp = false;
              await soloDoc.submit(widgets.textEditor.controller.text);
              widgets.onSwipeUp();
            }
          case GestureDirections.down:
            if (hasSwipedUp) {
              widgets.onSwipeDown();
              hasSwipedUp = false;
              canSwipeUp = true;
            }
          default:
            break;
        }
      });
}
