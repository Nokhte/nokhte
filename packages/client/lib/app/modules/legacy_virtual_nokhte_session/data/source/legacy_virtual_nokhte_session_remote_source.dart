import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/domain/logic/logic.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LegacyVirtualNokhteSessionRemoteSource {
  Future<bool> checkifUserHasTheQuestion();
  Future<List> changeDesireToLeave(ChangeDesireToLeaveParams params);
}

class LegacyVirtualNokhteSessionRemoteSourceImpl
    implements LegacyVirtualNokhteSessionRemoteSource {
  final SupabaseClient supabase;

  final ActiveIrlNokhteSessionQueries queries;

  LegacyVirtualNokhteSessionRemoteSourceImpl({
    required this.supabase,
  }) : queries = ActiveIrlNokhteSessionQueries(supabase: supabase);

  @override
  checkifUserHasTheQuestion() async => false;

  @override
  Future<List> changeDesireToLeave(params) async {
    final value = params == ChangeDesireToLeaveParams.affirmative ? 2.0 : 1.0;
    await queries.updateCurrentPhases(value);
    return await queries.updateCurrentPhases(value);
  }
}
