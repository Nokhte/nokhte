// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'base_collaborative_text_editor_store.g.dart';

class BaseCollaborativeTextEditorStore = _BaseCollaborativeTextEditorStoreBase
    with _$BaseCollaborativeTextEditorStore;

abstract class _BaseCollaborativeTextEditorStoreBase extends Equatable
    with Store {
  final TextEditingController userController;
  final FocusNode userFocusNode;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final GesturePillStore gesturePillStore;
  final String onCommitedNavigationRoute;

  _BaseCollaborativeTextEditorStoreBase({
    required this.collaborativeTextUI,
    required this.gesturePillStore,
    required this.onCommitedNavigationRoute,
  })  : userController = collaborativeTextUI.controller,
        userFocusNode = collaborativeTextUI.focusNode;

  @observable
  bool isInitialLoad = true;

  @observable
  bool wantsToCommit = false;

  @observable
  DocInfoContent mostRecentDocInfoContent = DefaultEntities.docInfoContent;

  @action
  setMostRecentDocInfoContent(DocInfoContent newDocContent) =>
      mostRecentDocInfoContent = newDocContent;

  @action
  setWantsToCommit(bool newCommitStatus) => wantsToCommit = newCommitStatus;

  @action
  toggleIsInitialLoad() => isInitialLoad = !isInitialLoad;

  collaborativeDocListener(
    ObservableStream<DocInfoContent> docContentStream, {
    required Function(String) updateTheDoc,
    required Function consecrateTheCollaboration,
    required Function revertAffirmativeCommitDesire,
    required Function updateCommitStatusToAffirmative,
  }) =>
      docContentStream.distinct().listen((DocInfoContent value) async {
        setMostRecentDocInfoContent(value);
        initialContentLoad(value);
        updateTextUI(value);
        purposeIntegrityListener(
          value,
          ifUserHasFocus: revertAffirmativeCommitDesire,
        );
        wantsToCommitChanges(
          value,
          purposeIsCommitted: consecrateTheCollaboration,
        );
      });

  initialContentLoad(DocInfoContent value) {
    if (isInitialLoad) {
      if (value.content.isNotEmpty) {
        collaborativeTextUI.setText(value.content);
      }
      toggleIsInitialLoad();
    }
  }

  purposeIntegrityListener(DocInfoContent value,
      {required Function ifUserHasFocus}) {
    if (value.userCommitDesireStatus) {
      userFocusNode.addListener(() async {
        if (userFocusNode.hasFocus) {
          await ifUserHasFocus();
          gesturePillStore.setPillAnimationControl(Control.playReverseFromEnd);
        }
      });
    }
  }

  @observable
  bool blockUserControllerCallback = false;

  @action
  toggleBlockUserControllerCallback() =>
      blockUserControllerCallback = !blockUserControllerCallback;

  @observable
  bool blockUpdateTextUICallback = false;

  @action
  toggleBlockUpdateTextUICallback() =>
      blockUpdateTextUICallback = !blockUpdateTextUICallback;

  @action
  userTextControllerListener({
    required CollaborativeDocCoordinator collaborativeDocDB,
  }) async {
    userController.addListener(() async {
      if (!blockUserControllerCallback) {
        toggleBlockUpdateTextUICallback();
        await collaborativeDocDB.updateDoc(UpdateCollaborativeDocParams(
          newContent: userController.text,
        ));
        toggleBlockUpdateTextUICallback();
      }
    });
  }

  @action
  updateTextUI(DocInfoContent value) async {
    if (!blockUpdateTextUICallback) {
      if (value.lastEditor == LastEditedBy.collaborator && !isInitialLoad) {
        toggleBlockUserControllerCallback();
        final userDelta = userController.selection.start;
        collaborativeTextUI.setText(value.content);
        gesturePillStore.setPillAnimationControl(Control.playReverseFromEnd);
        userController.selection = TextSelection.fromPosition(
          TextPosition(
            offset: userDelta > userController.text.length
                ? userController.text.length
                : userDelta,
          ),
        );
        toggleBlockUserControllerCallback();
      }
    }
  }

  wantsToCommitChanges(
    DocInfoContent value, {
    required Function purposeIsCommitted,
  }) async {
    if (value.documentCommitStatus) {
      setWantsToCommit(true);
      gesturePillStore
          .setPillMovie(TopCircleColorChange.getMovie(firstGradientColors: [
        const Color(0xFFEB9040),
        const Color(0xFFD95C67),
      ], secondGradientColors: [
        const Color(0xFF09FD20),
        const Color(0xFF4CDC8B),
      ]));
      await purposeIsCommitted();
      gesturePillStore.setPillAnimationControl(Control.playFromStart);
      collaborativeTextUI.toggleWidgetVisibility();
      Future.delayed(
          Seconds.get(3),
          // () async => Modular.to.navigate('/p2p_purpose_session/phase-6/'));
          () async => Modular.to.navigate(onCommitedNavigationRoute));
    }
  }

  @action
  updateCommitStatusToAffirmative() =>
      gesturePillStore.setPillAnimationControl(Control.playFromStart);

  @override
  List<Object> get props => [];
}
