import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PurposeSessionRemoteSource {
  Future<bool> checkIfUserHasTheQuestion();
  Future<List> deleteCapsuleArrangement();
  Future<List> deleteCollaborativeDocument();
  Future<List> deleteSchedulingSession();
  Future<List> deleteSoloDocument();
  Future<List> deleteTheCollaboration();
}

class PurposeSessionRemoteSourceImpl implements PurposeSessionRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborations;
  final SoloSharableDocumentQueries soloSharableDocumentQueries;
  final WorkingCollaborativeSchedulingQueries
      workingCollaborativeSchedulingQueries;
  final WorkingCollaborativeDocumentsQueries
      workingCollaborativeDocumentsQueries;
  PurposeSessionRemoteSourceImpl({
    required this.supabase,
  })  : existingCollaborations =
            ExistingCollaborationsQueries(supabase: supabase),
        soloSharableDocumentQueries =
            SoloSharableDocumentQueries(supabase: supabase),
        workingCollaborativeDocumentsQueries =
            WorkingCollaborativeDocumentsQueries(supabase: supabase),
        workingCollaborativeSchedulingQueries =
            WorkingCollaborativeSchedulingQueries(supabase: supabase);

  @override
  Future<List> deleteTheCollaboration() async =>
      existingCollaborations.deleteUnConsecratedTheCollaboration();

  @override
  Future<bool> checkIfUserHasTheQuestion() async =>
      await existingCollaborations.checkIfUserHasTheQuestion();

  @override
  Future<List> deleteCollaborativeDocument() async =>
      await workingCollaborativeDocumentsQueries.deleteThedoc();

  @override
  Future<List> deleteSoloDocument() async =>
      await soloSharableDocumentQueries.deleteDocument();

  @override
  Future<List> deleteSchedulingSession() async =>
      await workingCollaborativeSchedulingQueries.deleteSchedulingSession();

  @override
  Future<List> deleteCapsuleArrangement() async {
    return [];
  }
}
