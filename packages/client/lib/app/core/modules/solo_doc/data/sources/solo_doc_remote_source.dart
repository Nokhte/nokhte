import 'package:primala_backend/existing_collaborations.dart';
import 'package:primala_backend/solo_sharable_documents.dart';
import 'package:primala_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';
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
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  late CollaboratorInfo collaborationInfo;

  SoloDocRemoteSourceImpl({
    required this.supabase,
  }) : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase);

  Future getCollaboratorUID() async {
    await existingCollaborationsQueries.figureOutActiveCollaboratorInfo();
    collaborationInfo = existingCollaborationsQueries.collaboratorInfo;
  }

  @override
  Future<List> createSoloDoc({required String docType}) async {
    await getCollaboratorUID();
    return await SoloSharableDocuments.createSoloDoc(
      supabase: supabase,
      ownerUID: collaborationInfo.theUsersUID,
      collaboratorUID: collaborationInfo.theCollaboratorsUID,
      docType: docType,
    );
  }

  @override
  Future<List> getSoloDocContent({required bool getCollaboratorsDoc}) async {
    return await SoloSharableDocuments.fetchDocInfo(
      supabase: supabase,
      ownerUID: getCollaboratorsDoc
          ? collaborationInfo.theCollaboratorsUID
          : collaborationInfo.theUsersUID,
      collaboratorUID: getCollaboratorsDoc
          ? collaborationInfo.theUsersUID
          : collaborationInfo.theCollaboratorsUID,
    );
  }

  @override
  Future<List> sealSoloDoc() async {
    return await SoloSharableDocuments.sealDocument(
      supabase: supabase,
      ownerUID: collaborationInfo.theUsersUID,
    );
  }

  @override
  Future<List> shareSoloDoc() async {
    return await SoloSharableDocuments.updateDocVisibility(
      supabase: supabase,
      ownerUID: collaborationInfo.theUsersUID,
      visibility: true,
    );
  }

  @override
  Future<List> submitDocContent({required String newContent}) async {
    return await SoloSharableDocuments.updateDocContent(
      supabase: supabase,
      ownerUID: collaborationInfo.theUsersUID,
      content: newContent,
    );
  }
}
