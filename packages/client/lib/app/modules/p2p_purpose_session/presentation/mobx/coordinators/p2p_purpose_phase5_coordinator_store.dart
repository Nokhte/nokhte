// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala/app/core/widgets/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_coordinator_store.g.dart';

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final CollaborativeTextEditorTrackerStore collaborativeText;
  final CollaborativeDocCoordinatorStore collaborativeDoc;

  @action
  screenConstructor() async {
    beachWaves.initiateSuspendedAtTheDepths();
    collaborativeDoc.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'purpose',
      ),
    );

    await collaborativeDoc.getContent(NoParams());
    collaborativeDoc.getContent.docContent.listen((value) {
      collaborativeText.userStore.controller.text = value;
      collaborativeText.collaboratorStore.controller.text = value;
      print(
          "GET CONTENT CLB => ${collaborativeText.collaboratorStore.controller.text} USER => ${collaborativeText.userStore.controller.text}");
    });

    collaborativeText.collaboratorStore.controller.addListener(() {
      final newContent = collaborativeText.collaboratorStore.controller.text;
      collaborativeText.userStore.controller.text = newContent;
      print(
          "CLB CTRLR => ${collaborativeText.collaboratorStore.controller.text} USER => ${collaborativeText.userStore.controller.text}");
    });

    collaborativeText.userStore.controller.addListener(() async {
      await collaborativeDoc.updateDoc(UpdateCollaborativeDocParams(
          newContent: collaborativeText.userStore.controller.text));
      print(
          "USER CTRLR => ${collaborativeText.collaboratorStore.controller.text} USER => ${collaborativeText.userStore.controller.text}");
    });
    // ok figure it out from here they are set now you need bilateral editing to work & concurrency & all that stuff.
    // textEditor.addEventListeners();
    // we should have 2 of these one of these is for user changing
    // and the other for the collaborator changing
    // collaborativeText.userStore.controller.addListener(() async {
    //   // final newContent = collaborativeText.userStore.controller.text;
    //   await collaborativeDoc
    //       .updateDoc(UpdateCollaborativeDocParams(newContent: 'uhhh'));
    //   // collaborativeText.userStore.controller.text = newContent;
    //   print("TIS UPDATED ");
    //   // for cursor changes & text changes
    // });
  }

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.collaborativeText,
    required this.collaborativeDoc,
  });

  @override
  List<Object> get props => [
// some items
      ];
}
