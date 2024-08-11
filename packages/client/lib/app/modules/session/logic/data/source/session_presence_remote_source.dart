import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionPresenceRemoteSource {
  Future<List> updateOnlineStatus(bool params);
  Future<List> setUserAsCurrentTalker();
  Future<List> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(double params);
  Stream<NokhteSessionMetadata> listenToSessionMetadata();
  bool cancelSessionMetadataStream();
  Future<List> addContent(String content);
  String getUserUID();
  Future<List> getPresetInformation(String unifiedUID);
  Future<List> getStaticSessionMetadata();
  Future<FunctionResponse> completeTheSession();
  Future<FunctionResponse> startTheSession();
  Future<List> checkIfHasDoneSessionBesides(String presetUID);
  Future<List> checkIfHasDoneSessionSessionType(String presetUID);
  Future<List> getUserMetadata();
}

class SessionPresenceRemoteSourceImpl implements SessionPresenceRemoteSource {
  final SupabaseClient supabase;
  final RTActiveNokhteSessionQueries rtQueries;
  final STActiveNokhteSessionQueries stQueries;
  final RTActiveNokhteSessionsStream stream;
  final CompanyPresetsQueries presetsQueries;
  final FinishedNokhteSessionQueries finishedQueries;
  final UserMetadataQueries userMetadata;
  SessionPresenceRemoteSourceImpl({required this.supabase})
      : rtQueries = RTActiveNokhteSessionQueries(supabase: supabase),
        stQueries = STActiveNokhteSessionQueries(supabase: supabase),
        finishedQueries = FinishedNokhteSessionQueries(supabase: supabase),
        presetsQueries = CompanyPresetsQueries(supabase: supabase),
        stream = RTActiveNokhteSessionsStream(supabase: supabase),
        userMetadata = UserMetadataQueries(supabase: supabase);

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
        params,
      );

  @override
  completeTheSession() async => await rtQueries.completeTheSession();

  @override
  addContent(content) async => await stQueries.addContent(content);

  @override
  startTheSession() async => await rtQueries.startTheSession();

  @override
  getUserUID() => supabase.auth.currentUser?.id ?? '';

  @override
  getStaticSessionMetadata() async => await stQueries.select();

  @override
  getPresetInformation(unifiedUID) async =>
      await presetsQueries.getInfoFromUnifiedUID(unifiedUID);

  @override
  checkIfHasDoneSessionBesides(presetUID) async =>
      await finishedQueries.selectOne(
        unifiedUID: presetUID,
        invertToNeq: true,
      );

  @override
  checkIfHasDoneSessionSessionType(presetUID) async =>
      await finishedQueries.selectOne(unifiedUID: presetUID);

  @override
  getUserMetadata() async => await userMetadata.getUserMetadata();
}
