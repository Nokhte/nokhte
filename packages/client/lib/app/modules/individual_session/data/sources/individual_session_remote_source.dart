import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> getCurrentPerspectives();
// Future<> ();
// Future<> ();
}

class IndividualSesionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries queries;

  IndividualSesionRemoteSourceImpl({
    required this.supabase,
  }) : queries = P2PPerspectivesTrackingQueries(supabase: supabase);
  @override
  Future<List> getCurrentPerspectives() async =>
      await queries.selectPerspectivesRow();
}
