import 'package:nokhte_backend/tables/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchThePurposeRemoteSource {
  Future<List> fetchThePurpose();
}

class FetchThePurposeSourceImpl implements FetchThePurposeRemoteSource {
  final SupabaseClient supabase;
  final FinishedCollaborativeP2PPurposeDocumentsQueries queries;

  FetchThePurposeSourceImpl({
    required this.supabase,
  }) : queries = FinishedCollaborativeP2PPurposeDocumentsQueries(
          supabase: supabase,
        );

  @override
  Future<List> fetchThePurpose() async {
    return queries.fetchDocInfo(docType: 'purpose');
  }
}
