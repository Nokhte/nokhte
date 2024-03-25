import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';
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

  static const Map<SoloDocTypes, String> docTypeMap = {
    SoloDocTypes.collective: "collective",
    SoloDocTypes.purpose: "purpose",
  };

  SoloDocsRemoteSourceImpl({
    required this.supabase,
  });

  @override
  createSoloDoc(params) async => throw UnimplementedError();

  @override
  getSoloDocContent(params) async => throw UnimplementedError();

  @override
  sealSoloDoc() async => throw UnimplementedError();

  @override
  shareSoloDoc() async => throw UnimplementedError();
  @override
  submitDocContent(params) async => throw UnimplementedError();
}
