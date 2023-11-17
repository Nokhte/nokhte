import 'package:supabase_flutter/supabase_flutter.dart';

class EndCollaboratorSearch {
  static invoke({
    required SupabaseClient supabase,
    required String firstUserUID,
  }) async {
    return await supabase.functions.invoke("end-collaborator-search", body: {
      'overstayingWayfarer': firstUserUID,
    });
  }
}
