import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaboratorPresenceRemoteSource {
  Future<List> updateOnlineStatus(UpdatePresencePropertyParams params);
  Future<List> updateOnCallStatus(UpdatePresencePropertyParams params);
  Future<List> updateTimerStatus(bool params);
  Future<List> setUserAsCurrentTalker();
  Future<void> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(UpdateCurrentPhaseParams params);
  Stream<CollaborationSessionMetadata> getSessionMetadata();
  bool cancelSessionMetadataStream();
}

class CollaboratorPresenceRemoteSourceImpl
    implements CollaboratorPresenceRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries queries;
  final ExistingCollaborationsStream stream;

  CollaboratorPresenceRemoteSourceImpl({
    required this.supabase,
  })  : queries = ExistingCollaborationsQueries(supabase: supabase),
        stream = ExistingCollaborationsStream(supabase: supabase);

  @override
  updateOnCallStatus(params) async => queries.updateOnCallStatus(
        params.newStatus,
        shouldEditCollaboratorsInfo: params.shouldUpdateCollaboratorsIndex,
      );

  @override
  updateOnlineStatus(params) async => queries.updateOnlineStatus(
        params.newStatus,
        shouldEditCollaboratorsInfo: params.shouldUpdateCollaboratorsIndex,
      );

  @override
  updateTimerStatus(bool params) async =>
      queries.updateTimerRunningStatus(params);

  @override
  Future<void> clearTheCurrentTalker() async =>
      await queries.clearTheCurrentTalker();

  @override
  Future<List> setUserAsCurrentTalker() async =>
      await queries.setUserAsTheCurrentTalker();

  @override
  Stream<CollaborationSessionMetadata> getSessionMetadata() =>
      stream.getSessionMetadata();

  @override
  updateCurrentPhase(params) async =>
      await queries.updateCurrentPhases(params.newPhase,
          shouldEditCollaboratorsInfo: params.shouldUpdateCollaboratorsIndex);

  @override
  bool cancelSessionMetadataStream() =>
      stream.cancelGetCollaboratorSearchStream();
}
