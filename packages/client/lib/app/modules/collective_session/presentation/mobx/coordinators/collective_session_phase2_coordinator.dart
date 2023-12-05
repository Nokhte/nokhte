// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_collaborative_doc_db_store.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'collective_session_phase2_widgets_coordinator.dart';
part 'collective_session_phase2_coordinator.g.dart';

class CollectiveSessionPhase2Coordinator = _CollectiveSessionPhase2CoordinatorBase
    with _$CollectiveSessionPhase2Coordinator;

abstract class _CollectiveSessionPhase2CoordinatorBase
    extends BaseCollaborativeDocDBStore with Store {
  final VoiceCallActionsStore voiceCall;
  final CollectiveSessionPhase2WidgetsCoordinator widgets;

  _CollectiveSessionPhase2CoordinatorBase({
    required super.swipe,
    required this.widgets,
    required this.voiceCall,
    required super.collaborativeDocDB,
  }) : super(docType: 'collective');

  @observable
  String previousWord = "";

  bool isInitialLoad = true;

  @observable
  bool bottomCircleIsUp = false;

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets();
    await collaborativeDocDB.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'collective',
      ),
    );
    initListeners();
    await collaborativeDocDB.getContent(NoParams());
  }

  initListeners() {
    gestureListener(
      widgetsSwipeUpCallback: widgets.updateCommitStatusToAffirmative,
    );
    widgets.collaborativeDocListener(
      collaborativeDocDB.getContent.docContent,
      updateTheDoc: updateTheDoc,
      onCommitted: commitTheDoc,
      revertAffirmativeCommitDesire: revertAffirmativeCommitDesire,
      updateCommitStatusToAffirmative: updateCommitStatusToAffirmative,
    );
  }

  commitTheDoc(String docContent) async {
    await collaborativeDocDB.moveToFinishedDocs(
      MoveToFinishedDocsParams(
        docContent: docContent,
        docType: 'collective',
      ),
    );
  }
}
