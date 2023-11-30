// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
part 'p2p_purpose_phase5_coordinator.g.dart';

class P2PPurposePhase5Coordinator = _P2PPurposePhase5CoordinatorBase
    with _$P2PPurposePhase5Coordinator;

abstract class _P2PPurposePhase5CoordinatorBase extends BaseCoordinator
    with Store {
  // final BeachWavesTrackerStore beachWaves;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final ExistingCollaborationsCoordinator existingCollaborations;
  final GesturePillStore gesturePillStore;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final CollaborativeDocCoordinator collaborativeDocDB;
  final TextEditingController userController;
  final FocusNode userFocusNode;
  final VoiceCallCoordinator voiceCallCoordinator;
  final SwipeDetector swipe;
  final BeachWavesTrackerStore beachWaves;

  _P2PPurposePhase5CoordinatorBase({
    required this.beachWaves,
    required this.existingCollaborations,
    required this.collaborativeTextUI,
    required this.collaborativeDocDB,
    required this.voiceCallCoordinator,
    required this.abortPurposeSessionArtifactsStore,
    required this.gesturePillStore,
    required this.swipe,
  })  : userController = collaborativeTextUI.controller,
        userFocusNode = collaborativeTextUI.focusNode;

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @observable
  bool bottomCircleIsUp = false;

  @action
  screenConstructor() async {
    collaborativeTextUI.toggleWidgetVisibility();
    gesturePillStore.setFadeOut(false);
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => await null,
      inactiveCallback: () async => await null,
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase5CollectiveCreation,
        ),
      ),
    );
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ], secondGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ]));
    beachWaves.initiateSuspendedAtTheDepths();
    await voiceCallCoordinator.joinCall(shouldEnterTheCallMuted: false);
    await collaborativeDocDB.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'purpose',
      ),
    );
    await collaborativeDocDB.getContent(NoParams());

    collaborativeDocListener();
    gestureListener();
    userTextControllerListener();
  }

  collaborativeDocListener() =>
      collaborativeDocDB.getContent.docContent.listen((DocInfoContent value) {
        initialContentLoad(value);
        purposeIntegrityListener(value);
        wantsToCommitChangesAndListener(value);
        updateTheDoc(value);
      });

  purposeIntegrityListener(DocInfoContent value) {
    if (value.userCommitDesireStatus) {
      userCursorListener();
    }
  }

  userCursorListener() => userFocusNode.addListener(() async {
        if (userFocusNode.hasFocus) {
          collaborativeDocDB.updateCommitDesire(
              const UpdateCommitDesireStatusParams(wantsToCommit: false));

          gesturePillStore.setPillAnimationControl(Control.playReverseFromEnd);
        }
      });

  userTextControllerListener() => userController.addListener(() async {
        await collaborativeDocDB.updateDelta(
            UpdateUserDeltaParams(newDelta: userController.selection.start));
        if (previousWord != userController.text && !isInitialLoad) {
          previousWord = userController.text;
          await collaborativeDocDB.updateDoc(
              UpdateCollaborativeDocParams(newContent: userController.text));
        }
      });

  initialContentLoad(DocInfoContent value) {
    if (isInitialLoad) {
      collaborativeTextUI.setText(value.content);
      isInitialLoad = false;
    }
  }

  updateTheDoc(DocInfoContent value) {
    if (value.lastEditedBy != value.currentUserUID) {
      final userDelta = userController.selection.start;
      collaborativeTextUI.setText(value.content);
      collaborativeDocDB.updateCommitDesire(
          const UpdateCommitDesireStatusParams(wantsToCommit: false));

      gesturePillStore.setPillAnimationControl(Control.playReverseFromEnd);
      userController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: userDelta > userController.text.length
              ? userController.text.length
              : userDelta,
        ),
      );
    }
  }

  wantsToCommitChangesAndListener(DocInfoContent value) async {
    if (value.documentCommitStatus) {
      gesturePillStore
          .setPillMovie(TopCircleColorChange.getMovie(firstGradientColors: [
        const Color(0xFFEB9040),
        const Color(0xFFD95C67),
      ], secondGradientColors: [
        const Color(0xFF09FD20),
        const Color(0xFF4CDC8B),
      ]));
      await existingCollaborations.consecrateTheCollaboration(NoParams());
      gesturePillStore.setPillAnimationControl(Control.playFromStart);
      collaborativeTextUI.toggleWidgetVisibility();
      Future.delayed(Seconds.get(3),
          () async => Modular.to.navigate('/p2p_purpose_session/phase-6/'));
    }
  }

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            updateCommitStatus();
          default:
            break;
        }
      });

  @action
  updateCommitStatus() async {
    await collaborativeDocDB.updateCommitDesire(
      const UpdateCommitDesireStatusParams(wantsToCommit: true),
    );
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
  }

  @override
  List<Object> get props => [];
}
