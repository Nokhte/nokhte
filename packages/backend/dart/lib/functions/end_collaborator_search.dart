import 'package:supabase_flutter/supabase_flutter.dart';

class EndCollaboratorSearch {
  static invoke({
    required SupabaseClient supabase,
    required String firstUserUID,
  }) async {
    await supabase.functions.invoke("end-collaborator-search", body: {
      'overstayingWayfarer': firstUserUID,
    });
  }
}
