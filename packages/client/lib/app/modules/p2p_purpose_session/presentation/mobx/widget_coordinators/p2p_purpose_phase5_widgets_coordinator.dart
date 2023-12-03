// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_widgets_coordinator.g.dart';

class P2PPurposePhase5WidgetsCoordinator = _P2PPurposePhase5WidgetsCoordinatorBase
    with _$P2PPurposePhase5WidgetsCoordinator;

abstract class _P2PPurposePhase5WidgetsCoordinatorBase extends Equatable
    with Store {
  final GesturePillStore gesturePillStore;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final TextEditingController userController;
  final FocusNode userFocusNode;
  final NewBeachWavesStore newBeachWaves;

  _P2PPurposePhase5WidgetsCoordinatorBase({
    required this.newBeachWaves,
    required this.gesturePillStore,
    required this.collaborativeTextUI,
  })  : userController = collaborativeTextUI.controller,
        userFocusNode = collaborativeTextUI.focusNode;

  @action
  constructor() {
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
    newBeachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
    //
  }

  @observable
  String previousWord = "";

  @observable
  bool isInitialLoad = true;

  @observable
  bool wantsToCommit = false;

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
      docContentStream.distinct().listen((DocInfoContent value) {
        print("what is happening inside of here?? ${value.content}");
        initialContentLoad(value);
        purposeIntegrityListener(
          value,
          ifUserHasFocus: revertAffirmativeCommitDesire,
        );
        wantsToCommitChanges(
          value,
          purposeIsCommitted: consecrateTheCollaboration,
        );
        updateTextUI(value, ifUserEditsTheDoc: updateTheDoc);
      });

  initialContentLoad(DocInfoContent value) {
    if (isInitialLoad) {
      collaborativeTextUI.setText(value.content);
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

  userTextControllerListener({
    required CollaborativeDocCoordinator collaborativeDocDB,
  }) async {
    userController.addListener(() async {
      await collaborativeDocDB.updateDelta(
          UpdateUserDeltaParams(newDelta: userController.selection.start));
      if (previousWord != userController.text && !isInitialLoad) {
        previousWord = userController.text;
        await collaborativeDocDB.updateDoc(
            UpdateCollaborativeDocParams(newContent: userController.text));
      }
    });
  }

  updateTextUI(
    DocInfoContent value, {
    required Function(String) ifUserEditsTheDoc,
  }) async {
    if (value.lastEditedBy != value.currentUserUID) {
      final userDelta = userController.selection.start;
      collaborativeTextUI.setText(value.content);
      await ifUserEditsTheDoc(collaborativeTextUI.controller.text);
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
      Future.delayed(Seconds.get(3),
          () async => Modular.to.navigate('/p2p_purpose_session/phase-6/'));
    }
  }

  @action
  updateCommitStatusToAffirmative() =>
      gesturePillStore.setPillAnimationControl(Control.playFromStart);

  @override
  List<Object> get props => [
// some items
      ];
}
