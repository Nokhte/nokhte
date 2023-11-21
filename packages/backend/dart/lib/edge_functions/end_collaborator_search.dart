import 'package:supabase_flutter/supabase_flutter.dart';

class EndCollaboratorSearch {
  final SupabaseClient supabase;
  final String userUID;

  EndCollaboratorSearch({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  invoke() async =>
      await supabase.functions.invoke("end-collaborator-search", body: {
        'overstayingWayfarer': userUID,
      });
}
