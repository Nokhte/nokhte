import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:intl/intl.dart';

class NokhteSessionArtifactModel extends NokhteSessionArtifactEntity {
  const NokhteSessionArtifactModel({
    required super.title,
    required super.content,
    required super.id,
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
                .contains(collaboratorRow[UserNamesConstants.UID]) &&
            nokhteSession[FinishedNokhteSessionQueries.CONTENT].isNotEmpty) {
          String title = '';
          final userIndex =
              nokhteSession[FinishedNokhteSessionQueries.COLLABORATOR_UIDS]
                          .first ==
                      userUID
                  ? 0
                  : 1;
          if (nokhteSession[FinishedNokhteSessionQueries.ALIASES][userIndex]
              .isEmpty) {
            title =
                'Session with ${collaboratorRow[UserNamesConstants.FIRST_NAME]}';
          } else {
            title =
                nokhteSession[FinishedNokhteSessionQueries.ALIASES][userIndex];
          }
          final date = DateTime.parse(
              nokhteSession[FinishedNokhteSessionQueries.SESSION_TIMESTAMP]);
          temp.add(NokhteSessionArtifactModel(
            date: formatDate(date),
            title: title,
            content: nokhteSession[FinishedNokhteSessionQueries.CONTENT],
            id: nokhteSession[FinishedNokhteSessionQueries.ID],
          ));
        }
      }
    }
    return temp;
  }
}
