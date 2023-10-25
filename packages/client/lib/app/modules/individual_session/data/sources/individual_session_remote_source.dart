import 'package:primala_backend/finished_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> fetchThePurpose();
}

class IndividualSessionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final FinishedCollaborativeP2PPurposeDocumentsQueries queries;
  // finish this off

  IndividualSessionRemoteSourceImpl({
    required this.supabase,
  }) : queries = FinishedCollaborativeP2PPurposeDocumentsQueries(
          supabase: supabase,
        );

  @override
  Future<List> fetchThePurpose() async {
    return queries.fetchDocInfo(docType: 'purpose');
  }
}
