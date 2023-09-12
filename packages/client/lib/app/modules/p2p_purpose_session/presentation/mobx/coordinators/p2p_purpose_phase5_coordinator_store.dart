// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala/app/core/widgets/mobx.dart';
import 'package:primala_backend/working_collaborative_documents.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_coordinator_store.g.dart';

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final CollaborativeDocCoordinatorStore collaborativeDocDB;
  final TextEditingController userController;
  final TextEditingController collaboratorController;
  final FocusNode userFocusNode;
  final FocusNode collaboratorFocusNode;

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @action
  screenConstructor() async {
    beachWaves.initiateSuspendedAtTheDepths();
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

    await collaborativeDocDB.getCollaboratorInfo(NoParams());
    collaborativeDocDB.getCollaboratorInfo.collaboratorDocinfo
        .listen((CollaboratorDocInfo value) {
      print(value.toString());
      if (value.isPresent == true && collaboratorController.text.isNotEmpty) {
        collaboratorFocusNode.requestFocus();
        collaboratorController.selection = TextSelection.collapsed(
          // TextPosition(
          offset: value.delta,
          // ),
        );
      } else {
        collaboratorFocusNode.unfocus();
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

    userFocusNode.addListener(() async {
      if (userFocusNode.hasFocus) {
        await collaborativeDocDB
            .updatePresence(const UpdateUserPresenceParams(newPresence: true));
        // print("A USER JUST WENT INTO THE TEXT DOC");
      } else {
        await collaborativeDocDB
            .updatePresence(const UpdateUserPresenceParams(newPresence: false));
        await collaborativeDocDB
            .updateDelta(const UpdateUserDeltaParams(newDelta: -1));
        // print("A USER JUST LEFT THE TEXT DOC");
      }
    });
  }

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.collaborativeTextUI,
    required this.collaborativeDocDB,
  })  : userController = collaborativeTextUI.userStore.controller,
        userFocusNode = collaborativeTextUI.userStore.focusNode,
        collaboratorController =
            collaborativeTextUI.collaboratorStore.controller,
        collaboratorFocusNode = collaborativeTextUI.collaboratorStore.focusNode;

  @override
  List<Object> get props => [
// some items
      ];
}
