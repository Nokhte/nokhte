import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/tables/real_time_disabled/individual_sessions/queries.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> getCurrentPerspectives();
  Future<List> createIndividualSession();
  Future<List> updateSessionMetadata(UpdateSessionMetadataParams params);
}

class IndividualSessionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries perpsectivesQueries;
  final IndividualSessionsQueries sessionQueries;

  IndividualSessionRemoteSourceImpl({
    required this.supabase,
  })  : perpsectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        sessionQueries = IndividualSessionsQueries(supabase: supabase);
  @override
  Future<List> getCurrentPerspectives() async =>
      await perpsectivesQueries.selectPerspectivesRow();

  @override
  Future<List> createIndividualSession() async =>
      await sessionQueries.createNewSession();

  @override
  Future<List> updateSessionMetadata(
          UpdateSessionMetadataParams params) async =>
      await sessionQueries.updateSessionMetadata(newMetadata: params);
}
