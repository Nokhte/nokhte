import 'package:supabase_flutter/supabase_flutter.dart';

class InitiateCollaboratorSearch {
  final SupabaseClient supabase;
  final String currentUserUID;

  InitiateCollaboratorSearch({required this.supabase})
      : currentUserUID = supabase.auth.currentUser?.id ?? '';

  Future<FunctionResponse> invoke(String queryUID) async =>
      await supabase.functions.invoke("initiate-collaborator-search", body: {
        'wayfarerUID': currentUserUID,
        'queryUID': queryUID,
      });
}
