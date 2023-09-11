import 'package:primala_backend/working_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborativeDocRemoteSource {
  Stream<String> getCollaborativeDocContent();
  Stream<int> getCollaboratorDelta();
  Stream<bool> getCollaboratorPresence();
  Future<List> createCollaborativeDoc({required String docType});
  Future<void> updateCollaborativeDoc({required String newContent});
}

class CollaborativeDocRemoteSourceImpl implements CollaborativeDocRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final WorkingCollaborativeDocumentsStreams streams;

  CollaborativeDocRemoteSourceImpl({
    required this.supabase,
    required this.streams,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Stream<String> getCollaborativeDocContent() {
    // return Stream.value("hi");
    return streams.docContentStream(
        supabase: supabase, userUID: currentUserUID);
  }

  @override
  Stream<int> getCollaboratorDelta() {
    return streams.getCollaboratorDelta(
        supabase: supabase, userUID: currentUserUID);
  }

  @override
  Stream<bool> getCollaboratorPresence() {
    return streams.isCollaboratorOnDocument(
        supabase: supabase, userUID: currentUserUID);
  }

  @override
  Future<List> createCollaborativeDoc({required String docType}) async {
    return await WorkingCollaborativeDocumentsQueries
        .createCollaborativeDocument(
            supabase: supabase,
            currentUserUID: currentUserUID,
            docType: 'purpose');
  }

  @override
  Future<void> updateCollaborativeDoc({required String newContent}) async {
    return await WorkingCollaborativeDocumentsQueries.updateExistingDocument(
        supabase: supabase,
        currentUserUID: currentUserUID,
        newContent: newContent);
  }
}
