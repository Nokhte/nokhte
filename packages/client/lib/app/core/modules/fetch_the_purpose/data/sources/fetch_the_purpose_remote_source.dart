import 'package:primala_backend/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchThePurposeRemoteSource {
  Future<List> fetchThePurpose();
}

class FetchThePurposeSourceImpl implements FetchThePurposeRemoteSource {
  final SupabaseClient supabase;
  final FinishedCollaborativeP2PPurposeDocumentsQueries queries;
  // finish this off

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
// nateretla