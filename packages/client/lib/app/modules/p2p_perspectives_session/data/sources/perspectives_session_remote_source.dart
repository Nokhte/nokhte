import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte_backend/tables/working_perspectives_positioning.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PPerspectivesSessionRemoteSource {
  Future<void> updateCurrentQuadrant(int params);
  Future<void> commitThePerspectives(List<String> params);
  Future<void> updateTheStagingArea(List<String> params);
  Future<Stream<PerspectivesPositioning>> fetchPerspectivesStream(
    NoParams params,
  );
  Future<void> createAPerspectivesSession(NoParams params);
}

class P2PPerspectivesSessionRemoteSourceImpl
    implements P2PPerspectivesSessionRemoteSource {
  final SupabaseClient supabase;
  final WorkingPerspectivesPositioningQueries workingQueries;
  final WorkingPerspectivesPositioningStream workingStreams;
  final P2PPerspectivesTrackingQueries trackingQueries;

  P2PPerspectivesSessionRemoteSourceImpl({required this.supabase})
      : workingQueries =
            WorkingPerspectivesPositioningQueries(supabase: supabase),
        workingStreams =
            WorkingPerspectivesPositioningStream(supabase: supabase),
        trackingQueries = P2PPerspectivesTrackingQueries(supabase: supabase);

  @override
  Future<void> commitThePerspectives(List<String> params) async {
    return await trackingQueries.insertNewPerspectives(newPerspectives: params);
  }

  @override
  Future<void> createAPerspectivesSession(NoParams params) async {
    await workingQueries.createPositioningSession();
  }

  @override
  Future<Stream<PerspectivesPositioning>> fetchPerspectivesStream(
      NoParams params) async {
    return workingStreams.getStream();
  }

  @override
  Future<void> updateCurrentQuadrant(int params) async {
    workingQueries.updateCurrentQuadrant(newQuadrant: params);
  }

  @override
  Future<List> updateTheStagingArea(List<String> params) async {
    return workingQueries.updateStagingAreaArr(newArr: params);
  }
}
