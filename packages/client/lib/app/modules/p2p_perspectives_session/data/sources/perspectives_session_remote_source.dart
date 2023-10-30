import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte_backend/working_perspectives_positioning.dart';

abstract class P2PPerspectivesSessionRemoteSource {
  Future<List> updateCurrentQuadrant(int params);
  Future<List> commitThePerspectives(NoParams params);
  Future<List> updateTheStagingArea(List<String> params);
  Future<Stream<PerspectivesPositioning>> fetchPerspectivesStream(
    NoParams params,
  );
  Future<List> createAPerspectivesSession(NoParams params);
}
