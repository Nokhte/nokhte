// ignore_for_file: constant_identifier_names
import 'constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveMonetizationSessionsStream with ActiveMonetizationSessionConstants {
  bool explanationCompletionListeningStatus = false;
  final SupabaseClient supabase;

  ActiveMonetizationSessionsStream({required this.supabase});

  bool cancelExplanationCompletionStatus() {
    explanationCompletionListeningStatus = false;
    return explanationCompletionListeningStatus;
  }

  Stream<bool> listenToExplanationCompletionStatus() async* {
    explanationCompletionListeningStatus = true;
    await for (var event in supabase.from(TABLE).stream(primaryKey: ['id'])) {
      if (!explanationCompletionListeningStatus) {
        break;
      }
      if (event.isNotEmpty) {
        if (event.first[HAVE_FINISHED_EXPLANATIONS].every((e) => e == true)) {
          yield true;
        } else {
          yield false;
        }
      } else {
        yield false;
      }
    }
  }
}
