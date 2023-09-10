import 'package:primala_backend/solo_p2p_purpose_documents.dart';
import 'package:primala_backend/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PPurposeSessionSoloDocRemoteSource {
  Future<List> createSoloDoc();

  Future<List> getSoloDocContent({required bool getCollaboratorsDoc});

  Future<List> sealSoloDoc();

  Future<List> shareSoloDoc();

  Future<List> submitDocContent({required String newContent});
}

class P2PPurposeSessionSoloDocRemoteSourceImpl
    implements P2PPurposeSessionSoloDocRemoteSource {
  final SupabaseClient supabase;
  late String currentUserUID;
  late String collaboratorUID;

  P2PPurposeSessionSoloDocRemoteSourceImpl({required this.supabase})
      : currentUserUID = supabase.auth.currentUser?.id ?? '';

  Future getCollaboratorUID() async {
    final res =
        await ExistingCollaborationsQueries.fetchCollaboratorsUIDAndNumber(
            supabase: supabase, currentUserUID: currentUserUID);
    collaboratorUID = res[0];
  }

  @override
  Future<List> createSoloDoc() async {
    await getCollaboratorUID();
    return await SoloP2PPurposeDocuments.createSoloDoc(
      supabase: supabase,
      ownerUID: currentUserUID,
      collaboratorUID: collaboratorUID,
    );
  }

  @override
  Future<List> getSoloDocContent({required bool getCollaboratorsDoc}) async {
    return await SoloP2PPurposeDocuments.fetchDocInfo(
      supabase: supabase,
      ownerUID: getCollaboratorsDoc ? collaboratorUID : currentUserUID,
      collaboratorUID: getCollaboratorsDoc ? currentUserUID : collaboratorUID,
    );
  }

  @override
  Future<List> sealSoloDoc() async {
    return await SoloP2PPurposeDocuments.sealDocument(
      supabase: supabase,
      ownerUID: currentUserUID,
    );
  }

  @override
  Future<List> shareSoloDoc() async {
    return await SoloP2PPurposeDocuments.updateDocVisibility(
      supabase: supabase,
      ownerUID: currentUserUID,
      visibility: true,
    );
  }

  @override
  Future<List> submitDocContent({required String newContent}) async {
    return await SoloP2PPurposeDocuments.updateDocContent(
      supabase: supabase,
      ownerUID: currentUserUID,
      content: newContent,
    );
  }
}
