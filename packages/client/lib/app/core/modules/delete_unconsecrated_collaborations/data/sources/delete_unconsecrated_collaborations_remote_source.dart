import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';

abstract class DeleteUnconsecratedCollaborationsRemoteSource {
  Future<List> deleteCapsuleArrangement();
  Future<List> deleteCollaborativeDocument();
  Future<List> deleteSchedulingSession();
  Future<List> deleteSoloDocument();
  Future<List> deleteTheCollaboration();
  Future<List> checkForUnconsecratedCollaboration();
}

class DeleteUnconsecratedCollaborationsRemoteSourceImpl
    implements DeleteUnconsecratedCollaborationsRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborations;
  final SoloSharableDocumentQueries soloSharableDocumentQueries;
  final WorkingCollaborativeSchedulingQueries
      workingCollaborativeSchedulingQueries;
  final WorkingCollaborativeDocumentsQueries
      workingCollaborativeDocumentsQueries;
  DeleteUnconsecratedCollaborationsRemoteSourceImpl({
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

  @override
  Future<List> checkForUnconsecratedCollaboration() async {
    final res = await existingCollaborations.getCollaborations(
      filterForUnconsecrated: true,
    );
    return res;
  }
}
