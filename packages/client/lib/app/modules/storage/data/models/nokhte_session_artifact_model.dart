import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:intl/intl.dart';

class NokhteSessionArtifactModel extends NokhteSessionArtifactEntity {
  const NokhteSessionArtifactModel({
    required super.title,
    required super.content,
    required super.sessionUID,
    required super.date,
  });

  static formatDate(DateTime date) {
    DateFormat formatter = DateFormat('MMMM d, yyyy');
    return formatter.format(date);
  }

  static List<NokhteSessionArtifactModel> fromSupabase({
    required List nokhteSessionRes,
    required List collaboratorRowsRes,
    required String userUID,
  }) {
    List<NokhteSessionArtifactModel> temp = [];
    for (var nokhteSession in nokhteSessionRes) {
      for (var collaboratorRow in collaboratorRowsRes) {
        if (nokhteSession[FinishedNokhteSessionQueries.COLLABORATOR_UIDS]
                .contains(collaboratorRow["uid"]) &&
            nokhteSession[FinishedNokhteSessionQueries.CONTENT].isNotEmpty) {
          String title = 'Session with ${collaboratorRow["first_name"]}';
          final date = DateTime.parse(
              nokhteSession[FinishedNokhteSessionQueries.SESSION_TIMESTAMP]);
          temp.add(NokhteSessionArtifactModel(
            date: formatDate(date),
            title: title,
            content: nokhteSession[FinishedNokhteSessionQueries.CONTENT],
            sessionUID: nokhteSession[FinishedNokhteSessionQueries.SESSION_UID],
          ));
        }
      }
      temp = temp.toSet().toList();
    }
    return temp;
  }
}
