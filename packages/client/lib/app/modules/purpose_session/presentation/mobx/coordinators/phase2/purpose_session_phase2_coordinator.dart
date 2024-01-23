// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
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
  final CollaboratorPresenceCoordinator collaboratorPresence;
  final SoloDocsCoordinator soloDoc;

  _PurposeSessionPhase2CoordinatorBase({
    required this.widgets,
    required this.swipe,
    required this.collaboratorPresence,
    required this.soloDoc,
  });

  @observable
  bool hasInitializedTimer = false;

  @observable
  bool isFirstTimeBothAreInSync = true;

  @observable
  bool canSwipeUp = false;

  @observable
  bool hasSwipedUp = false;

  @action
  constructor() async {
    widgets.constructor();
    await collaboratorPresence.listen();
    await collaboratorPresence.updateCurrentPhase(2.0);
    if (collaboratorPresence.getSessionMetadataStore.collaboratorPhase == 2) {
      initTimer();
    }
    collaboratorPresence.setBasePhaseForScreen(2.0);
    await soloDoc.create(SoloDocTypes.purpose);
    initReactors();
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

  @action
  onInactive() async {
    await collaboratorPresence.updateTimerStatus(false);
    await collaboratorPresence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await collaboratorPresence.updateTimerStatus(true);
    await collaboratorPresence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
  }

  initReactors() {
    onCollaboratorOnlinePresenceChangeReactor();
    bothCollaboratorsAreOnlineAndInSyncReactor();
    currentPhaseReactor();
    timerReactor();
    swipeReactor();
    widgets.initReactors(
      onKeyboardUp: onKeyboardUp,
      onKeyboardDown: onKeyboardDown,
      onTimesUp: onTimesUp,
      onSwipeUpCompleted: onPhaseChange,
    );
  }

  onCollaboratorOnlinePresenceChangeReactor() => reaction(
          (p0) =>
              collaboratorPresence.getSessionMetadataStore.collaboratorIsOnline,
          (p0) async {
        if (p0) {
          widgets.onCollaboratorJoined();
        } else {
          widgets.onCollaboratorLeft();
          await collaboratorPresence.updateCallStatus(
              UpdatePresencePropertyParams.collaboratorNegative());
        }
      });

  @action
  initTimer() {
    widgets.initTimer();
    hasInitializedTimer = true;
  }

  bothCollaboratorsAreOnlineAndInSyncReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore
              .bothCollaboratorsAreInSyncAndOnline, (p0) {
        if (p0 && isFirstTimeBothAreInSync) {
          isFirstTimeBothAreInSync = false;
          initTimer();
          // widgets.initTimer();
          // hasInitializedTimer = true;
        }
      });

  timerReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore.timerShouldRun,
          (p0) {
        if (p0) {
          // if (!hasInitializedTimer) {
          //   widgets.initTimer();
          //   hasInitializedTimer = true;
          // } else {
          widgets.resumeTimer();
          // }
        } else {
          widgets.pausetimer();
        }
      });

  @action
  onPhaseChange() async {
    print(
        "??? ${collaboratorPresence.getSessionMetadataStore.collaboratorPhase} ${collaboratorPresence.getSessionMetadataStore.userPhase}");
    if (collaboratorPresence.getSessionMetadataStore.collaboratorPhase == 2.5) {
      await soloDoc.share();
      widgets.onEarlyRelease();
    }
  }

  @action
  onTimesUp() async {
    await soloDoc.submit(widgets.textEditor.controller.text);
    await soloDoc.share();
    await collaboratorPresence.updateCurrentPhase(2.5);
  }

  currentPhaseReactor() => reaction(
      (p0) => collaboratorPresence.getSessionMetadataStore.collaboratorPhase,
      (p0) => onPhaseChange());

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            if (canSwipeUp &&
                !hasSwipedUp &&
                widgets.hasCompletedIntroduction) {
              final collaboratorIsFinished = collaboratorPresence
                      .getSessionMetadataStore.collaboratorPhase ==
                  2.5;
              widgets.onSwipeUp(collaboratorIsFinished: collaboratorIsFinished);
              hasSwipedUp = true;
              canSwipeUp = false;
              await soloDoc.submit(widgets.textEditor.controller.text);
              await collaboratorPresence.updateCurrentPhase(2.5);
              // onPhaseChange();
            }
          case GestureDirections.down:
            if (hasSwipedUp) {
              widgets.onSwipeDown();
              hasSwipedUp = false;
              await collaboratorPresence.updateCurrentPhase(2);
              canSwipeUp = true;
            }
          default:
            break;
        }
      });
}
