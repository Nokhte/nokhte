// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/gesture_pill/gesture_pill.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
import 'collective_session_phase2_widgets_coordinator.dart';
part 'collective_session_phase2_coordinator.g.dart';

class CollectiveSessionPhase2Coordinator = _CollectiveSessionPhase2CoordinatorBase
    with _$CollectiveSessionPhase2Coordinator;

abstract class _CollectiveSessionPhase2CoordinatorBase extends Equatable
    with Store {
  final VoiceCallActionsStore voiceCall;
  final CollaborativeDocCoordinator collaborativeDoc;
  final CollectiveSessionPhase2WidgetsCoordinator widgets;

  final SwipeDetector swipe;
  final TextEditingController userController;
  final FocusNode userFocusNode;

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @observable
  bool bottomCircleIsUp = false;

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets();
    await collaborativeDoc.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'collective',
      ),
    );
    await collaborativeDoc.getContent(NoParams());
    collaborativeDocListener();
    gestureListener();
    userTextControllerListener();

    //
  }

  _CollectiveSessionPhase2CoordinatorBase({
    required this.swipe,
    required this.widgets,
    required this.voiceCall,
    required this.collaborativeDoc,
  })  : userController = widgets.collaborativeTextEditor.controller,
        userFocusNode = widgets.collaborativeTextEditor.focusNode;

  collaborativeDocListener() =>
      collaborativeDoc.getContent.docContent.listen((DocInfoContent value) {
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
          collaborativeDoc.updateCommitDesire(
              const UpdateCommitDesireStatusParams(wantsToCommit: false));

          widgets.gesturePill
              .setPillAnimationControl(Control.playReverseFromEnd);
        }
      });

  @action
  userTextControllerListener() => userController.addListener(() async {
        await collaborativeDoc.updateDelta(
            UpdateUserDeltaParams(newDelta: userController.selection.start));
        if (previousWord != userController.text && !isInitialLoad) {
          previousWord = userController.text;
          await collaborativeDoc.updateDoc(UpdateCollaborativeDocParams(
            newContent: userController.text,
          ));
        }
      });

  initialContentLoad(DocInfoContent value) {
    if (isInitialLoad) {
      widgets.collaborativeTextEditor.setText(value.content);
      isInitialLoad = false;
    }
  }

  updateTheDoc(DocInfoContent value) {
    if (!value.lastEditWasTheUser) {
      final userDelta = userController.selection.start;
      widgets.collaborativeTextEditor.setText(value.content);
      collaborativeDoc.updateCommitDesire(
          const UpdateCommitDesireStatusParams(wantsToCommit: false));

      // widgets.gesturePill.setPillAnimationControl(Control.playReverseFromEnd);
      userController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: userDelta > userController.text.length
              ? userController.text.length
              : userDelta,
        ),
      );
    }
  }

  wantsToCommitChangesAndListener(DocInfoContent value) {
    if (value.documentCommitStatus) {
      widgets.gesturePill
          .setPillMovie(TopCircleColorChange.getMovie(firstGradientColors: [
        const Color(0xFFEB9040),
        const Color(0xFFD95C67),
      ], secondGradientColors: [
        const Color(0xFF09FD20),
        const Color(0xFF4CDC8B),
      ]));
      widgets.gesturePill.setPillAnimationControl(Control.playFromStart);
      widgets.collaborativeTextEditor.toggleWidgetVisibility();
      Future.delayed(Seconds.get(3), () async => widgets.goBackHome());
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
    await collaborativeDoc.updateCommitDesire(
      const UpdateCommitDesireStatusParams(wantsToCommit: true),
    );
    widgets.gesturePill.setPillAnimationControl(Control.playFromStart);
  }

  @override
  List<Object> get props => [];
}
