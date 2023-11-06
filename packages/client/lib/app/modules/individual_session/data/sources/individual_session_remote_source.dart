import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> getCurrentPerspectives();
// Future<> ();
// Future<> ();
}

class IndividualSessionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries queries;

  IndividualSessionRemoteSourceImpl({
    required this.supabase,
  }) : queries = P2PPerspectivesTrackingQueries(supabase: supabase);
  @override
  Future<List> getCurrentPerspectives() async =>
      await queries.selectPerspectivesRow();
}
