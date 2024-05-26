import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CleanUpCollaborationArtifactsRemoteSource {
  Future<FunctionResponse> deleteActiveNokhteSession();
}

class CleanUpCollaborationArtifactsRemoteSourceImpl
    implements CleanUpCollaborationArtifactsRemoteSource {
  final SupabaseClient supabase;
  final RTActiveNokhteSessionQueries irlActiveNokhteSessionQueries;
  CleanUpCollaborationArtifactsRemoteSourceImpl({
    required this.supabase,
  }) : irlActiveNokhteSessionQueries =
            RTActiveNokhteSessionQueries(supabase: supabase);

  @override
  deleteActiveNokhteSession() async =>
      await irlActiveNokhteSessionQueries.completeTheSession();
}
