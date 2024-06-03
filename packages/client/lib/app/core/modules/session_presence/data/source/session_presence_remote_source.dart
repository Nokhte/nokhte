import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionPresenceRemoteSource {
  Future<List> updateOnlineStatus(UpdatePresencePropertyParams params);
  Future<List> setUserAsCurrentTalker();
  Future<List> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(double params);
  Stream<NokhteSessionMetadata> listenToSessionMetadata();
  bool cancelSessionMetadataStream();
  Future<List> addContent(String content);
  Future<FunctionResponse> completeTheSession();
  Future<List> updateHasGyroscope(bool hasGyroscope);
  Future<FunctionResponse> startTheSession();
}

class SessionPresenceRemoteSourceImpl implements SessionPresenceRemoteSource {
  final SupabaseClient supabase;
  final RTActiveNokhteSessionQueries rtQueries;
  final STActiveNokhteSessionQueries stQueries;
  final RTActiveNokhteSessionsStream stream;
  SessionPresenceRemoteSourceImpl({required this.supabase})
      : rtQueries = RTActiveNokhteSessionQueries(supabase: supabase),
        stQueries = STActiveNokhteSessionQueries(supabase: supabase),
        stream = RTActiveNokhteSessionsStream(supabase: supabase);

  @override
  cancelSessionMetadataStream() => stream.cancelGetSessionMetadataStream();

  @override
  clearTheCurrentTalker() async =>
      await rtQueries.updateSpeakerSpotlight(addUserToSpotlight: false);

  @override
  listenToSessionMetadata() => stream.listenToPresenceMetadata();

  @override
  setUserAsCurrentTalker() async => await rtQueries.updateSpeakerSpotlight(
        addUserToSpotlight: true,
      );

  @override
  updateCurrentPhase(params) async =>
      await rtQueries.updateCurrentPhases(params);

  @override
  updateOnlineStatus(params) async => await rtQueries.updateOnlineStatus(
        params.newStatus,
      );

  @override
  completeTheSession() async => await rtQueries.completeTheSession();

  @override
  addContent(content) async => await stQueries.addContent(content);

  @override
  updateHasGyroscope(hasGyroscope) async =>
      await stQueries.updateHasGyroscope(hasGyroscope);

  @override
  startTheSession() async => await rtQueries.startTheSession();
}
