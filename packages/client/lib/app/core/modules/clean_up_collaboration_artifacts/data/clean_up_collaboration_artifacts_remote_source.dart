import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CleanUpCollaborationArtifactsRemoteSource {
  Future<FunctionResponse> deleteActiveNokhteSession();
}

class CleanUpCollaborationArtifactsRemoteSourceImpl
    implements CleanUpCollaborationArtifactsRemoteSource {
  final SupabaseClient supabase;
  final ActiveNokhteSessionQueries irlActiveNokhteSessionQueries;
  CleanUpCollaborationArtifactsRemoteSourceImpl({
    required this.supabase,
  }) : irlActiveNokhteSessionQueries =
            ActiveNokhteSessionQueries(supabase: supabase);

  @override
  deleteActiveNokhteSession() async =>
      await irlActiveNokhteSessionQueries.completeTheSession();
}
