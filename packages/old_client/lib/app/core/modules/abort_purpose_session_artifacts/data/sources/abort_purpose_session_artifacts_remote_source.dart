import 'package:nokhte/app/core/modules/timer/data/data.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

abstract class AbortPurposeSessionArtifactsRemoteSource
    with DeleteTheTimerRemoteSourceInterface {
  Future<void> abortTheCollaboration();
  Future<void> deleteSoloDocuments();
  Future<void> deleteWorkingCollaborativeDocument();
}

class AbortPurposeSessionArtifactsRemoteSourceImpl extends TimerRemoteSourceImpl
    implements AbortPurposeSessionArtifactsRemoteSource {
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final SoloSharableDocumentQueries soloSharableDocumentQueries;
  final WorkingCollaborativeDocumentsQueries
      workingCollaborativeDocumentsQueries;
  AbortPurposeSessionArtifactsRemoteSourceImpl({required super.supabase})
      : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        soloSharableDocumentQueries =
            SoloSharableDocumentQueries(supabase: supabase),
        workingCollaborativeDocumentsQueries =
            WorkingCollaborativeDocumentsQueries(supabase: supabase);

  @override
  Future<void> abortTheCollaboration() async =>
      await existingCollaborationsQueries.abortUnConsecratedTheCollaboration();
  @override
  Future<void> deleteSoloDocuments() async =>
      await soloSharableDocumentQueries.deleteDocument();
  @override
  Future<void> deleteWorkingCollaborativeDocument() async =>
      await workingCollaborativeDocumentsQueries.deleteThedoc();
}
