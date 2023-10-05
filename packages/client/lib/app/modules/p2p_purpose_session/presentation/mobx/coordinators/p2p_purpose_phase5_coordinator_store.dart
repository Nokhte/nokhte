// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/logic/update_commit_desire_status.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala_backend/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_coordinator_store.g.dart';

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final GesturePillStore gesturePillStore;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final CollaborativeDocCoordinatorStore collaborativeDocDB;
  final TextEditingController collaboratorController;
  final TextEditingController userController;
  final FocusNode userFocusNode;
  final FocusNode collaboratorFocusNode;
  final FetchAgoraTokenStore fetchAgoraTokenStore;
  final FetchChannelIdStore fetchChannelIdStore;
  final AgoraCallbacksStore agoraCallbacksStore;
  final VoiceCallActionsStore voiceCallActionsStore;

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.collaborativeTextUI,
    required this.collaborativeDocDB,
    required this.agoraCallbacksStore,
    required this.voiceCallActionsStore,
    required this.fetchAgoraTokenStore,
    required this.fetchChannelIdStore,
    required this.gesturePillStore,
  })  : userController = collaborativeTextUI.userStore.controller,
        userFocusNode = collaborativeTextUI.userStore.focusNode,
        collaboratorController =
            collaborativeTextUI.collaboratorStore.controller,
        collaboratorFocusNode = collaborativeTextUI.collaboratorStore.focusNode;

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @observable
  bool bottomCircleIsUp = false;

  @action
  screenConstructor() async {
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
          token: fetchAgoraTokenStore.token,
          channelId: fetchChannelIdStore.channelId,
        ),
      ),
    );
    await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
    collaborativeDocDB.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'purpose',
      ),
    );

    await collaborativeDocDB.getContent(NoParams());
    collaborativeDocDB.getContent.docContent.listen((DocInfoContent value) {
      if (isInitialLoad) {
        collaborativeTextUI.setText(value.content);
        isInitialLoad = false;
      }
      if (value.userCommitDesireStatus) {
        userFocusNode.addListener(() async {
          if (userFocusNode.hasFocus) {
            collaborativeDocDB.updateCommitDesire(
                const UpdateCommitDesireStatusParams(wantsToCommit: false));

            gesturePillStore
                .setPillAnimationControl(Control.playReverseFromEnd);
          }
        });
      }
      if (value.documentCommitStatus) {
        gesturePillStore
            .setPillMovie(TopCircleColorChange.getMovie(firstGradientColors: [
          const Color(0xFFEB9040),
          const Color(0xFFD95C67),
        ], secondGradientColors: [
          const Color(0xFF09FD20),
          const Color(0xFF4CDC8B),
        ]));
        gesturePillStore.setPillAnimationControl(Control.playFromStart);
        // do the transition here
        // Modular.to.navigate('p2p_purpose_session_phase-6');
      }

      if (value.lastEditedBy != value.currentUserUID) {
        final userDelta = userController.selection.start;
        // ohh
        collaborativeTextUI.setText(value.content);
        userController.selection = TextSelection.fromPosition(
          TextPosition(
            offset: userDelta > userController.text.length
                ? userController.text.length
                : userDelta,
          ),
        );
      }
    });

    userController.addListener(() async {
      await collaborativeDocDB.updateDelta(
          UpdateUserDeltaParams(newDelta: userController.selection.start));
      if (previousWord != userController.text && !isInitialLoad) {
        previousWord = userController.text;
        await collaborativeDocDB.updateDoc(
            UpdateCollaborativeDocParams(newContent: userController.text));
        collaboratorController.text = userController.text;
      }
    });
  }

  @action
  swipeUpCallback() async {
    await collaborativeDocDB.updateCommitDesire(
      const UpdateCommitDesireStatusParams(wantsToCommit: true),
    );
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
  }

  @override
  List<Object> get props => [
// some items
      ];
}
