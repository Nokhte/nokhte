import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/constants/types/default_stream_class.dart';

class ExistingCollaborationsStream extends DefaultStreamClass {
  Stream<bool> notifyWhenForged({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    isListening = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!isListening) {
        break;
      }
      if (event.isNotEmpty) {
        if (event.first["collaborator_one"] == userUID ||
            event.first["collaborator_two"] == userUID) {
          yield true;
        } else {
          yield false;
        }
      }
    }
  }
}
