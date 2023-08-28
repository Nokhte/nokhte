// import 'package:supabase_flutter/supabase_flutter.dart';

// class ExistingCollaborationsStream {
//   static empty() {}

//   /// so it's going to take in supabase and the user id and output a bool
//   static bool notifyWhenForged({
//     required SupabaseClient supabase,
//     required String userUID,
//     Function elseLogic = empty,
//   }) {
//     /// ok so this works in test but needs to be modified for prod environment
//     bool collaborationForged = false;
//     supabase
//         .from('existing_collaborations')
//         .stream(primaryKey: ['id']).listen((event) {
//       if (event.isNotEmpty) {
//         if (event[0]["collaborator_one"] == userUID ||
//             event[0]["collaborator_two"] == userUID) {
//           collaborationForged = true;
//         } else {
//           elseLogic();
//         }
//       }
//     });
//     return collaborationForged;
//   }
// }

import 'package:supabase_flutter/supabase_flutter.dart';

class ExistingCollaborationsStream {
  static Stream<bool> notifyWhenForged({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
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
}
