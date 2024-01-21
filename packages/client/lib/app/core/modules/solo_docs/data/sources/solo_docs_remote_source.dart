import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SoloDocsRemoteSource {
  Future<List> createSoloDoc(SoloDocTypes params);

  Future<List> getSoloDocContent(GetSoloDocParams params);

  Future<List> sealSoloDoc();

  Future<List> shareSoloDoc();

  Future<List> submitDocContent(String params);
}

class SoloDocsRemoteSourceImpl implements SoloDocsRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  late CollaboratorInfo collaborationInfo;
  late SoloSharableDocumentQueries soloDocQueries;

  static const Map<SoloDocTypes, String> docTypeMap = {
    SoloDocTypes.collective: "collective",
    SoloDocTypes.purpose: "purpose",
  };

  SoloDocsRemoteSourceImpl({
    required this.supabase,
  })  : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        soloDocQueries = SoloSharableDocumentQueries(supabase: supabase);

  @override
  Future<List> createSoloDoc(params) async =>
      await soloDocQueries.createSoloDoc(docTypeMap[params] as String);

  @override
  Future<List> getSoloDocContent(params) async =>
      await soloDocQueries.getDocInfo(
        getCollaboratorsDoc: params.getCollaboratorsDoc,
      );

  @override
  Future<List> sealSoloDoc() async => await soloDocQueries.sealDocument();

  @override
  Future<List> shareSoloDoc() async => await soloDocQueries.updateDocVisibility(
        makeVisible: true,
      );

  @override
  Future<List> submitDocContent(params) async =>
      await soloDocQueries.updateDocContent(params);
}
