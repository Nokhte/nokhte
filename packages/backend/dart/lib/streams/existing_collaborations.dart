import 'package:supabase_flutter/supabase_flutter.dart';

// class ExistingCollaborationsStream {
//   static Stream<bool> notifyWhenForged({
//     required SupabaseClient supabase,
//     required String userUID,
//   }) async* {
//     await for (var event in supabase
//         .from('existing_collaborations')
//         .stream(primaryKey: ['id'])) {
//       if (event.isNotEmpty) {
//         if (event[0]["collaborator_one"] == userUID ||
//             event[0]["collaborator_two"] == userUID) {
//           yield true;
//         } else {
//           yield false;
//         }
//       }
//     }
//   }
// }

class ExistingCollaborationsStream {
  bool isListening = false;

  Stream<bool> notifyWhenForged({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    isListening = true;
    // Use a flag to control the loop
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!isListening) {
        // Exit the loop when isListening is set to false
        break;
      }
      if (event.isNotEmpty) {
        if (event[0]["collaborator_one"] == userUID ||
            event[0]["collaborator_two"] == userUID) {
          yield true;
        } else {
          yield false;
        }
      }
    }
  }

  // Call this method to cancel the stream
  void cancelStream() {
    isListening = false;
  }
}
