// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveNokhteSessionsStream {
  final String userUID;
  final SupabaseClient supabase;

  static const TABLE_NAME = 'active_nokhte_sessions';

  bool getActiveNokhteSessionCreationListingingStatus = false;

  ActiveNokhteSessionsStream({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  cancelGetActiveNokhteSessionCreationStatus() {
    getActiveNokhteSessionCreationListingingStatus = false;
    return getActiveNokhteSessionCreationListingingStatus;
  }

  Stream<bool> getActiveNokhteSessionCreationStatus() async* {
    getActiveNokhteSessionCreationListingingStatus = true;
    await for (var event
        in supabase.from(TABLE_NAME).stream(primaryKey: ['id'])) {
      if (!getActiveNokhteSessionCreationListingingStatus) {
        break;
      }
      if (event.isNotEmpty) {
        yield true;
      } else {
        yield false;
      }
    }
  }
}
