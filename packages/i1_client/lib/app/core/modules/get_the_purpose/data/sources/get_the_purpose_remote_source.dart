import 'package:nokhte_backend/tables/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GetThePurposeRemoteSource {
  Future<List> getThePurpose();
}

class GetThePurposeSourceImpl implements GetThePurposeRemoteSource {
  final SupabaseClient supabase;
  final FinishedCollaborativeDocumentsQueries queries;

  GetThePurposeSourceImpl({
    required this.supabase,
  }) : queries = FinishedCollaborativeDocumentsQueries(
          supabase: supabase,
        );

  @override
  Future<List> getThePurpose() async {
    return queries.getDocInfo(docType: 'purpose');
  }
}
