import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/irl_active_nokhte_sessions/types/types.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IrlNokhteSessionPresenceRemoteSourceImpl
    implements BasePresenceRemoteSource<IrlNokhteSessionMetadata> {
  final SupabaseClient supabase;
  final IrlActiveNokhteSessionQueries queries;
  final IrlActiveNokhteSessionsStream stream;
  IrlNokhteSessionPresenceRemoteSourceImpl({required this.supabase})
      : queries = IrlActiveNokhteSessionQueries(supabase: supabase),
        stream = IrlActiveNokhteSessionsStream(supabase: supabase);

  @override
  cancelSessionMetadataStream() => stream.cancelGetSessionMetadataStream();

  @override
  clearTheCurrentTalker() async => await queries.clearTheCurrentTalker();

  @override
  getSessionMetadata() => stream.getPresenceMetadata();

  @override
  setUserAsCurrentTalker() async => await queries.setUserAsTheCurrentTalker();

  @override
  updateCurrentPhase(params) async => await queries.updateCurrentPhases(params);

  @override
  updateOnlineStatus(params) async => await queries.updateOnlineStatus(
        params.newStatus,
        shouldEditCollaboratorsInfo: params.shouldUpdateCollaboratorsIndex,
      );
}
