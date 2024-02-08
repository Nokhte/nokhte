import 'package:nokhte/app/modules/nokhte_session/domain/logic/logic.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NokhteSessionRemoteSource {
  Future<bool> checkifUserHasTheQuestion();
  Future<List> changeDesireToLeave(ChangeDesireToLeaveParams params);
}

class NokhteSessionRemoteSourceImpl implements NokhteSessionRemoteSource {
  final SupabaseClient supabase;

  final ActiveNokhteSessionQueries queries;

  NokhteSessionRemoteSourceImpl({
    required this.supabase,
  }) : queries = ActiveNokhteSessionQueries(supabase: supabase);

  @override
  checkifUserHasTheQuestion() async =>
      await queries.checkIfUserHasTheQuestion();

  @override
  Future<List> changeDesireToLeave(params) async =>
      await queries.updateCurrentPhases(params == ChangeDesireToLeaveParams.affirmative ? 2.0 :1.0);
}
