import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/existing_collaborations.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsStream extends CollaborativeQueries {
  String userUID = '';
  ExistingCollaborationsStream({required super.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  bool collaboratorSearchListeningStatus = false;
  bool whoTalkedLastListeningStatus = false;

  Stream<bool> getCollaboratorSearchStatus() async* {
    collaboratorSearchListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!collaboratorSearchListeningStatus) {
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

  cancelGetCollaboratorSearchStream() =>
      collaboratorSearchListeningStatus = false;

  cancelWhoTalkedLastStream() => whoTalkedLastListeningStatus = false;

  Stream<String> getWhoTalkedLast() async* {
    whoTalkedLastListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!whoTalkedLastListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield '';
      } else {
        yield event.first[ExistingCollaborationsQueries.whoTalkedLast]
                as String? ??
            '';
      }
    }
  }
}
