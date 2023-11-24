// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/logic/update_commit_desire_status.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
part 'p2p_purpose_phase5_coordinator_store.g.dart';

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final UpdateExistingCollaborationsCoordinator updateExistingCollaborations;
  final GesturePillStore gesturePillStore;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final CollaborativeDocCoordinatorStore collaborativeDocDB;
  final TextEditingController userController;
  final FocusNode userFocusNode;
  final GetAgoraTokenStore getAgoraTokenStore;
  final GetChannelIdStore getChannelIdStore;
  final AgoraCallbacksStore agoraCallbacksStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final SwipeDetector swipe;

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.updateExistingCollaborations,
    required this.collaborativeTextUI,
    required this.collaborativeDocDB,
    required this.agoraCallbacksStore,
    required this.voiceCallActionsStore,
    required this.getAgoraTokenStore,
    required this.getChannelIdStore,
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
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ], secondGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ]));
    beachWaves.initiateSuspendedAtTheDepths();
    await voiceCallActionsStore.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: getAgoraTokenStore.token,
          channelId: getChannelIdStore.channelId,
        ),
      ),
    );
    await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
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
      await updateExistingCollaborations.consecrateTheCollaboration(NoParams());
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
