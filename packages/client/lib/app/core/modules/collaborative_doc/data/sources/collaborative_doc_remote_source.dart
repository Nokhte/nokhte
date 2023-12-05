import 'package:flutter/foundation.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/finished_collaborative_documents/queries.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:nokhte_core/custom_control_structures.dart';
import 'package:nokhte_core/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborativeDocRemoteSource {
  Stream<DocInfoContent> getCollaborativeDocContent();
  Stream<CollaboratorDocInfo> getCollaboratorDocInfo();
  Future<List> createCollaborativeDoc({required String docType});
  Future<void> updateUserPresence({required bool updatedUserPresence});
  Future<void> updateUserDelta({required int updatedDelta});
  Future<void> updateCommitDesireStatus({required bool wantsToCommit});
  Future<void> updateCollaborativeDoc({
    required String newContent,
  });
  Future<List> moveToFinishedDocs(
    MoveToFinishedDocsParams moveToFinishedDocsParams,
  );
}

class CollaborativeDocRemoteSourceImpl implements CollaborativeDocRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final WorkingCollaborativeDocumentsStreams streams;
  final WorkingCollaborativeDocumentsQueries workingQueries;
  final FinishedCollaborativeP2PPurposeDocumentsQueries finishedQueries;

  CollaborativeDocRemoteSourceImpl({
    required this.supabase,
  })  : workingQueries =
            WorkingCollaborativeDocumentsQueries(supabase: supabase),
        finishedQueries =
            FinishedCollaborativeP2PPurposeDocumentsQueries(supabase: supabase),
        streams = WorkingCollaborativeDocumentsStreams(supabase: supabase),
        currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Stream<DocInfoContent> getCollaborativeDocContent() {
    return streams.docContentStream();
  }

  @override
  Stream<CollaboratorDocInfo> getCollaboratorDocInfo() {
    return streams.getCollaboratorDocumentInfo();
  }

  @override
  Future<List> createCollaborativeDoc({required String docType}) async {
    await workingQueries.figureOutActiveCollaboratorInfoIfNotDoneAlready();
    const chosenCollaboratorNumber =
        kDebugMode ? CollaboratorNumbers.two : CollaboratorNumbers.one;
    return await StringComparison.isCollaborator(
        chosenCollaboratorNumber: chosenCollaboratorNumber,
        input: workingQueries.collaboratorInfo.theUsersCollaboratorNumber,
        callback: () async =>
            await workingQueries.createCollaborativeDocument(docType: docType),
        elseReturnVal: []);
  }

  @override
  Future<void> updateCollaborativeDoc({
    required String newContent,
  }) async {
    return await workingQueries.updateUsersDocContent(
      newContent: newContent,
    );
  }

  @override
  Future<void> updateUserDelta({required int updatedDelta}) async {
    return await workingQueries.updateDelta(deltaParam: updatedDelta);
  }

  @override
  Future<void> updateUserPresence({required bool updatedUserPresence}) async {
    return await workingQueries.updatePresence(isPresent: updatedUserPresence);
  }

  @override
  Future<void> updateCommitDesireStatus({required bool wantsToCommit}) async {
    return await workingQueries.updateCommitDesireStatus(
        wantsToCommitParam: wantsToCommit);
  }
}
