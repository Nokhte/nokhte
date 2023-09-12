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

enum WhoDidIt {
  initial,
  user,
  collaborator,
}

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final CollaborativeTextEditorTrackerStore collaborativeTextUI;
  final CollaborativeDocCoordinatorStore collaborativeDocDB;
  final TextEditingController userController;
  final TextEditingController collaboratorController;

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @observable
  WhoDidIt whoIsEditingIt = WhoDidIt.initial;

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

    userController.addListener(() async {
      if (previousWord != userController.text && !isInitialLoad) {
        previousWord = userController.text;
        await collaborativeDocDB.updateDoc(
            UpdateCollaborativeDocParams(newContent: userController.text));
        collaboratorController.text = userController.text;
      }
    });
  }

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.collaborativeTextUI,
    required this.collaborativeDocDB,
  })  : userController = collaborativeTextUI.userStore.controller,
        collaboratorController =
            collaborativeTextUI.collaboratorStore.controller;

  @override
  List<Object> get props => [
// some items
      ];
}
