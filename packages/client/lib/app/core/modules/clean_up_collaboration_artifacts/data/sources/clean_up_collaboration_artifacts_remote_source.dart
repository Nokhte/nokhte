import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CleanUpCollaborationArtifactsRemoteSource {
  Future<List> deleteIrlActiveNokhteSession();
}

class CleanUpCollaborationArtifactsRemoteSourceImpl
    implements CleanUpCollaborationArtifactsRemoteSource {
  final SupabaseClient supabase;
  final ActiveIrlNokhteSessionQueries irlActiveNokhteSessionQueries;
  CleanUpCollaborationArtifactsRemoteSourceImpl({
    required this.supabase,
  }) : irlActiveNokhteSessionQueries =
            ActiveIrlNokhteSessionQueries(supabase: supabase);

  @override
  Future<List> deleteIrlActiveNokhteSession() async =>
      await irlActiveNokhteSessionQueries.completeTheSession();
}
