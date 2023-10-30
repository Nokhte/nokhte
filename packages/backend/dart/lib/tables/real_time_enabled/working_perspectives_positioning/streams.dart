// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';
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
        );
      } else {
        yield PerspectivesPositioning(
          stagingAreaInfo: event[0]
              [WorkingPerspectivesPositioningConstants.stagingArea],
          lastEditedBy: event[0]["last_edited_by"] ?? '',
          collaboratorsQuadrant: event[0]
              ["${collaboratorInfo.theCollaboratorsNumber}_quadrant"],
        );
      }
    }
  }
}
