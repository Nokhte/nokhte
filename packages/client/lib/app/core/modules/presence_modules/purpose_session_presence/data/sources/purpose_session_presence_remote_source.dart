import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PurposeSessionPresenceRemoteSource
    extends BasePresenceRemoteSource<CollaborationSessionMetadata> {
  Future<List> updateTimerStatus(bool params);
}

class CollaboratorPresenceRemoteSourceImpl
    implements PurposeSessionPresenceRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries queries;
  final ExistingCollaborationsStream stream;

  CollaboratorPresenceRemoteSourceImpl({
    required this.supabase,
  })  : queries = ExistingCollaborationsQueries(supabase: supabase),
        stream = ExistingCollaborationsStream(supabase: supabase);

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
  updateCurrentPhase(params) async => await queries.updateCurrentPhases(params);

  @override
  bool cancelSessionMetadataStream() =>
      stream.cancelGetCollaboratorSearchStream();
}
