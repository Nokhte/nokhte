import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionPresenceRemoteSource {
  Future<List> updateOnlineStatus(UpdatePresencePropertyParams params);
  Future<List> setUserAsCurrentTalker();
  Future<List> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(double params);
  Stream<NokhteSessionMetadata> listenToSessionMetadata();
  bool cancelSessionMetadataStream();
  Future<FunctionResponse> addContent(String content);
  Future<FunctionResponse> completeTheSession();
  Future<List> updateHasGyroscope(bool hasGyroscope);
  Future<FunctionResponse> startTheSession();
}

class SessionPresenceRemoteSourceImpl implements SessionPresenceRemoteSource {
  final SupabaseClient supabase;
  final ActiveNokhteSessionQueries queries;
  final ActiveNokhteSessionsStream stream;
  SessionPresenceRemoteSourceImpl({required this.supabase})
      : queries = ActiveNokhteSessionQueries(supabase: supabase),
        stream = ActiveNokhteSessionsStream(supabase: supabase);

  @override
  cancelSessionMetadataStream() => stream.cancelGetSessionMetadataStream();

  @override
  clearTheCurrentTalker() async =>
      await queries.updateSpeakerSpotlight(addUserToSpotlight: false);

  @override
  listenToSessionMetadata() => stream.listenToPresenceMetadata();

  @override
  setUserAsCurrentTalker() async => await queries.updateSpeakerSpotlight(
        addUserToSpotlight: true,
      );

  @override
  updateCurrentPhase(params) async => await queries.updateCurrentPhases(params);

  @override
  updateOnlineStatus(params) async => await queries.updateOnlineStatus(
        params.newStatus,
      );

  @override
  completeTheSession() async => await queries.completeTheSession();

  @override
  addContent(content) async => await queries.addContent(content);

  @override
  updateHasGyroscope(hasGyroscope) async =>
      await queries.updateHasGyroscope(hasGyroscope);

  @override
  startTheSession() async => await queries.startTheSession();
}
