import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionPresenceRemoteSource {
  Future<List> updateOnlineStatus(UpdatePresencePropertyParams params);
  Future<List> setUserAsCurrentTalker();
  Future<void> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(double params);
  Stream<IrlNokhteSessionMetadata> getSessionMetadata();
  bool cancelSessionMetadataStream();
  Future<List> addContent(String content);
  Future<List> completeTheSession();
  Future<List> updateHasGyroscope(bool hasGyroscope);
  Future<List> startTheSession();
}

class SessionPresenceRemoteSourceImpl implements SessionPresenceRemoteSource {
  final SupabaseClient supabase;
  final ActiveIrlNokhteSessionQueries queries;
  final ActiveIrlNokhteSessionsStream stream;
  SessionPresenceRemoteSourceImpl({required this.supabase})
      : queries = ActiveIrlNokhteSessionQueries(supabase: supabase),
        stream = ActiveIrlNokhteSessionsStream(supabase: supabase);

  @override
  cancelSessionMetadataStream() => stream.cancelGetSessionMetadataStream();

  @override
  clearTheCurrentTalker() async => throw UnimplementedError();

  @override
  getSessionMetadata() => stream.getPresenceMetadata();

  @override
  setUserAsCurrentTalker() async => throw UnimplementedError();

  @override
  updateCurrentPhase(params) async => await queries.updateCurrentPhases(params);

  @override
  updateOnlineStatus(params) async => await queries.updateOnlineStatus(
        params.newStatus,
        shouldEditCollaboratorsInfo: params.shouldUpdateCollaboratorsIndex,
      );

  @override
  completeTheSession() async => await queries.completeTheSession();

  @override
  addContent(content) async => await queries.addContent(content);

  @override
  updateHasGyroscope(hasGyroscope) async =>
      await queries.updateHasGyroscope(hasGyroscope);

  @override
  Future<List> startTheSession() async => await queries.startTheSession();
}
