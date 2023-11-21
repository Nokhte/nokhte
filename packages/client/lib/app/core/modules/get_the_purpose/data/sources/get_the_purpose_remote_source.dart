import 'package:nokhte_backend/tables/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GetThePurposeRemoteSource {
  Future<List> getThePurpose();
}

class GetThePurposeSourceImpl implements GetThePurposeRemoteSource {
  final SupabaseClient supabase;
  final FinishedCollaborativeP2PPurposeDocumentsQueries queries;

  GetThePurposeSourceImpl({
    required this.supabase,
  }) : queries = FinishedCollaborativeP2PPurposeDocumentsQueries(
          supabase: supabase,
        );

  @override
  Future<List> getThePurpose() async {
    return queries.getDocInfo(docType: 'purpose');
  }
}
