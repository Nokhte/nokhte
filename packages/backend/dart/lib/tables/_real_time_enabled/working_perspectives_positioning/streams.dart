// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';
import './types/types.dart';

class WorkingPerspectivesPositioningStream extends CollaborativeQueries {
  bool isListening = false;
  String userUID = '';

  WorkingPerspectivesPositioningStream({
    required super.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  streamDispose() {
    isListening = false;
  }

  Stream<PerspectivesPositioning> getStream() async* {
    bool isListening = true;
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await for (var event in supabase
        .from(
      WorkingPerspectivesPositioningConstants.tableName,
    )
        .stream(primaryKey: ['id']).eq(
            "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)) {
      if (isListening == false) {
        return;
      }

      if (event.isEmpty) {
        yield PerspectivesPositioning(
          stagingAreaInfo: [],
          lastEditedBy: '',
          collaboratorsQuadrant: -1,
          currentUserUID: '',
          usersQuadrant: -1,
        );
      } else {
        yield PerspectivesPositioning(
            stagingAreaInfo: event
                .first[WorkingPerspectivesPositioningConstants.stagingArea],
            lastEditedBy: event.first["last_edited_by"] ?? '',
            currentUserUID: userUID,
            collaboratorsQuadrant: event
                .first["${collaboratorInfo.theCollaboratorsNumber}_quadrant"],
            usersQuadrant: event.first[
                "${collaboratorInfo.theUsersCollaboratorNumber}_quadrant"]);
      }
    }
  }
}
