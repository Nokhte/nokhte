import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AbortPurposeSessionArtifactsRemoteSource {
  Future<void> abortTheCollaboration();
  Future<void> deleteSoloDocuments();
  Future<void> deleteWorkingCollaborativeDocument();
}

class AbortPurposeSessionArtifactsRemoteSourceImpl
    implements AbortPurposeSessionArtifactsRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final SoloSharableDocumentQueries soloSharableDocumentQueries;
  final WorkingCollaborativeDocumentsQueries
      workingCollaborativeDocumentsQueries;
  AbortPurposeSessionArtifactsRemoteSourceImpl({required this.supabase})
      : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        soloSharableDocumentQueries =
            SoloSharableDocumentQueries(supabase: supabase),
        workingCollaborativeDocumentsQueries =
            WorkingCollaborativeDocumentsQueries(supabase: supabase);

  @override
  Future<void> abortTheCollaboration() async =>
      await existingCollaborationsQueries.deleteUnConsecratedTheCollaboration();
  @override
  Future<void> deleteSoloDocuments() async =>
      await soloSharableDocumentQueries.deleteDocument();
  @override
  Future<void> deleteWorkingCollaborativeDocument() async =>
      await workingCollaborativeDocumentsQueries.deleteThedoc();
}
