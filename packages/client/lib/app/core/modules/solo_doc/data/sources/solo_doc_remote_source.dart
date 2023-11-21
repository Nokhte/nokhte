import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
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
  late SoloSharableDocumentQueries soloDocQueries;

  SoloDocRemoteSourceImpl({
    required this.supabase,
  })  : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        soloDocQueries = SoloSharableDocumentQueries(supabase: supabase);

  @override
  Future<List> createSoloDoc({required String docType}) async =>
      await soloDocQueries.createSoloDoc(desiredDocType: docType);

  @override
  Future<List> getSoloDocContent({required bool getCollaboratorsDoc}) async =>
      await soloDocQueries.getDocInfo(
        getCollaboratorsDoc: getCollaboratorsDoc,
      );

  @override
  Future<List> sealSoloDoc() async => await soloDocQueries.sealDocument();

  @override
  Future<List> shareSoloDoc() async => await soloDocQueries.updateDocVisibility(
        makeVisible: true,
      );

  @override
  Future<List> submitDocContent({required String newContent}) async =>
      await soloDocQueries.updateDocContent(newContent);
}
