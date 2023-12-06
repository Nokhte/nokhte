// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
// * Mobx Codegen Inclusion
part 'base_collaborative_doc_db_store.g.dart';

class BaseCollaborativeDocDBStore = _BaseCollaborativeDocDBStoreBase
    with _$BaseCollaborativeDocDBStore;

abstract class _BaseCollaborativeDocDBStoreBase extends BaseCoordinator
    with Store {
  final CollaborativeDocCoordinator collaborativeDocDB;
  final String docType;
  final SwipeDetector swipe;

  _BaseCollaborativeDocDBStoreBase({
    required this.swipe,
    required this.collaborativeDocDB,
    required this.docType,
  });

  updateTheDoc(String newContent) async {
    await collaborativeDocDB.updateDoc(
      UpdateCollaborativeDocParams(
        newContent: newContent,
      ),
    );
  }

  @action
  moveToFinishedDocs(String docContent) async {
    await collaborativeDocDB.moveToFinishedDocs(
      MoveToFinishedDocsParams(
        docContent: docContent,
        docType: docType,
      ),
    );
  }

  revertAffirmativeCommitDesire() async =>
      await collaborativeDocDB.updateCommitDesire(
          const UpdateCommitDesireStatusParams(wantsToCommit: false));

  @action
  updateCommitStatusToAffirmative(Function widgetsAffirmativeCallback) async {}

  gestureListener({required Function widgetsSwipeUpCallback}) =>
      reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            await collaborativeDocDB.updateCommitDesire(
              const UpdateCommitDesireStatusParams(wantsToCommit: true),
            );
            widgetsSwipeUpCallback();
          default:
            break;
        }
      });

  @override
  List<Object> get props => [];
}
