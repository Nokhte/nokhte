// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_collaborative_doc_db_store.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/widget_coordinators/p2p_purpose_phase5_widgets_coordinator.dart';
part 'p2p_purpose_phase5_coordinator.g.dart';

class P2PPurposePhase5Coordinator = _P2PPurposePhase5CoordinatorBase
    with _$P2PPurposePhase5Coordinator;

abstract class _P2PPurposePhase5CoordinatorBase
    extends BaseCollaborativeDocDBStore with Store {
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final ExistingCollaborationsCoordinator existingCollaborations;
  final P2PPurposePhase5WidgetsCoordinator widgets;
  final VoiceCallCoordinator voiceCallCoordinator;

  _P2PPurposePhase5CoordinatorBase({
    required this.existingCollaborations,
    required this.widgets,
    required super.collaborativeDocDB,
    required this.voiceCallCoordinator,
    required this.abortPurposeSessionArtifactsStore,
    required super.swipe,
  }) : super(docType: 'purpose');

  @observable
  String previousWord = "";

  @observable
  bool isInitialLoad = true;

  @observable
  bool bottomCircleIsUp = false;

  initListeners() {
    widgets.collaborativeDocListener(
      collaborativeDocDB.getContent.docContent,
      updateTheDoc: updateTheDoc,
      onCommitted: consecrateTheCollaboration,
      revertAffirmativeCommitDesire: revertAffirmativeCommitDesire,
      updateCommitStatusToAffirmative: updateCommitStatusToAffirmative,
    );
    gestureListener(
      widgetsSwipeUpCallback: widgets.updateCommitStatusToAffirmative,
    );
    widgets.userTextControllerListener(
      collaborativeDocDB: collaborativeDocDB,
    );
  }

  @action
  screenConstructor() async {
    widgets.constructor();
    await collaborativeDocDB.getContent(NoParams());
    initListeners();
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => await null,
      inactiveCallback: () async => await null,
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase5CollectiveCreation,
        ),
      ),
    );
    if (!kDebugMode) {
      await voiceCallCoordinator.joinCall(shouldEnterTheCallMuted: false);
    }
    await collaborativeDocDB.createDoc(
      const CreateCollaborativeDocParams(
        docType: 'purpose',
      ),
    );
    await collaborativeDocDB.getContent(NoParams());
  }

  consecrateTheCollaboration(String docContent) async {
    await existingCollaborations.consecrateTheCollaboration(NoParams());
    await moveToFinishedDocs(docContent);
  }

  @override
  List<Object> get props => [];
}
