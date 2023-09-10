import 'package:primala_backend/working_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborativeDocRemoteSource {
  Stream<String> getCollaborativeDocContent();
  Stream<int> getCollaboratorDelta();
  Stream<bool> getCollaboratorPresence();
}

class CollaborativeDocRemoteSourceImpl implements CollaborativeDocRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final WorkingCollaborativeDocumentsStreams streams;

  CollaborativeDocRemoteSourceImpl({
    required this.supabase,
    required this.streams,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

  // todo needs to be a method for creating the documents

  @override
  Stream<String> getCollaborativeDocContent() {
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
}
