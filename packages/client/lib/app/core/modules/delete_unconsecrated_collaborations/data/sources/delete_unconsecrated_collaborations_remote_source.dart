import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DeleteUnconsecratedCollaborationsRemoteSource {
  Future<List> deleteIrlActiveNokhteSession();
}

class DeleteUnconsecratedCollaborationsRemoteSourceImpl
    implements DeleteUnconsecratedCollaborationsRemoteSource {
  final SupabaseClient supabase;
  final IrlActiveNokhteSessionQueries irlActiveNokhteSessionQueries;
  DeleteUnconsecratedCollaborationsRemoteSourceImpl({
    required this.supabase,
  }) : irlActiveNokhteSessionQueries =
            IrlActiveNokhteSessionQueries(supabase: supabase);

  @override
  Future<List> deleteIrlActiveNokhteSession() async =>
      await irlActiveNokhteSessionQueries.delete();
}
