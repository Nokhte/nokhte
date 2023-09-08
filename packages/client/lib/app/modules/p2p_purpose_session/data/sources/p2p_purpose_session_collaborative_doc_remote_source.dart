import 'package:primala_backend/working_collaborative_p2p_purpose_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PPurposeSessionCollaborativeDocRemoteSource {
  Stream<String> getCollaborativeDocContent();
  Stream<int> getCollaboratorDelta();
  Stream<bool> getCollaboratorPresence();
}

class P2PPurposeSessionCollaborativeDocRemoteSourceImpl
    implements P2PPurposeSessionCollaborativeDocRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final WorkingCollaborativeP2PPurposeDocumentsStreams streams;

  P2PPurposeSessionCollaborativeDocRemoteSourceImpl({
    required this.supabase,
    required this.streams,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

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
