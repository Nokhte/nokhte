import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

mixin BaseExitCoordinator on BaseCoordinator {
  SwipeDetector get swipe;
  SessionPresenceCoordinator get presence;
  SessionMetadataStore get sessionMetadata;

  final _blockUserPhaseReactor = Observable(false);
  bool get blockUserPhaseReactor => _blockUserPhaseReactor.value;
  _setBlockUserPhaseReactor(bool value) => _blockUserPhaseReactor.value = value;
  Action actionSetBlockUserPhaseReactor = Action(() {});

  setBlockUserPhaseReactor(bool value) {
    actionSetBlockUserPhaseReactor([value]);
  }

  initBaseExitCoordinatorActions() {
    actionSetBlockUserPhaseReactor = Action(_setBlockUserPhaseReactor);
  }

  swipeReactor({required Function onSwipeDown}) =>
      reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            ifTouchIsNotDisabled(() async {
              await presence.updateCurrentPhase(2.0);
              onSwipeDown();
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  userPhaseReactor({
    required Function initWrapUp,
  }) =>
      reaction((p0) => sessionMetadata.currentPhases.toString(), (p0) async {
        if ((sessionMetadata.numberOfAffirmative ==
            sessionMetadata.numberOfCollaborators)) {
          await initWrapUp();
        }
      });
}
