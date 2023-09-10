import 'package:primala_backend/solo_sharable_documents.dart';
import 'package:primala_backend/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SoloDocRemoteSource {
  Future<List> createSoloDoc({required String docType});

  Future<List> getSoloDocContent({required bool getCollaboratorsDoc});

  Future<List> sealSoloDoc();

  Future<List> shareSoloDoc();

  Future<List> submitDocContent({required String newContent});
}

class SoloDocRemoteSourceImpl implements SoloDocRemoteSource {
  final SupabaseClient supabase;
  late String currentUserUID;
  late String collaboratorUID;

  SoloDocRemoteSourceImpl({required this.supabase})
      : currentUserUID = supabase.auth.currentUser?.id ?? '';

  Future getCollaboratorUID() async {
    final res =
        await ExistingCollaborationsQueries.fetchCollaboratorsUIDAndNumber(
            supabase: supabase, currentUserUID: currentUserUID);
    collaboratorUID = res[0];
  }

  @override
  Future<List> createSoloDoc({required String docType}) async {
    await getCollaboratorUID();
    return await SoloSharableDocuments.createSoloDoc(
      supabase: supabase,
      ownerUID: currentUserUID,
      collaboratorUID: collaboratorUID,
      docType: docType,
    );
  }

  @override
  Future<List> getSoloDocContent({required bool getCollaboratorsDoc}) async {
    return await SoloSharableDocuments.fetchDocInfo(
      supabase: supabase,
      ownerUID: getCollaboratorsDoc ? collaboratorUID : currentUserUID,
      collaboratorUID: getCollaboratorsDoc ? currentUserUID : collaboratorUID,
    );
  }

  @override
  Future<List> sealSoloDoc() async {
    return await SoloSharableDocuments.sealDocument(
      supabase: supabase,
      ownerUID: currentUserUID,
    );
  }

  @override
  Future<List> shareSoloDoc() async {
    return await SoloSharableDocuments.updateDocVisibility(
      supabase: supabase,
      ownerUID: currentUserUID,
      visibility: true,
    );
  }

  @override
  Future<List> submitDocContent({required String newContent}) async {
    return await SoloSharableDocuments.updateDocContent(
      supabase: supabase,
      ownerUID: currentUserUID,
      content: newContent,
    );
  }
}
