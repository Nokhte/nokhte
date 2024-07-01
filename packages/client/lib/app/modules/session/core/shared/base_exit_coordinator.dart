import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

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
              // widgets.initBackToSpeaking();
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  numberOfAffirmativeReactor({
    required Function({
      required int totalNumberOfCollaborators,
      required int totalAffirmative,
    }) onInit,
    required Function onComplete,
  }) =>
      reaction((p0) => sessionMetadata.numberOfAffirmative, (p0) {
        if (p0 == sessionMetadata.numberOfCollaborators) {
          setBlockUserPhaseReactor(true);
        }
        onInit(
          totalNumberOfCollaborators: sessionMetadata.numberOfCollaborators,
          totalAffirmative: p0,
        );
      });

  userPhaseReactor({
    required Function initWrapUp,
    required Function initShowStatus,
  }) =>
      reaction((p0) => sessionMetadata.userPhase, (p0) async {
        if (!blockUserPhaseReactor) {
          if (p0 == sessionMetadata.affirmativePhase) {
            if ((sessionMetadata.numberOfAffirmative ==
                sessionMetadata.numberOfCollaborators)) {
              await initWrapUp();
              setBlockUserPhaseReactor(true);
            } else {
              initShowStatus();
            }
          }
        }
      });
  //
}
