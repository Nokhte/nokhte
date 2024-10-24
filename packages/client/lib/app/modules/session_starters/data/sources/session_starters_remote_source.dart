import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionStartersRemoteSource {
  Future<FunctionResponse> initializeSession();

  Future<FunctionResponse> nukeSession();

  Future<FunctionResponse> joinSession(String leaderUID);

  Stream<bool> listenToSessionActivationStatus();

  bool cancelSessionActivationStream();
}

class SessionStartersRemoteSourceImpl implements SessionStartersRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final RTActiveNokhteSessionsStream stream;
  final RTActiveNokhteSessionQueries queries;

  SessionStartersRemoteSourceImpl({
    required this.supabase,
  })  : stream = RTActiveNokhteSessionsStream(supabase: supabase),
        queries = RTActiveNokhteSessionQueries(supabase: supabase),
        currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  bool cancelSessionActivationStream() =>
      stream.cancelSessionActivationStream();

  @override
  Stream<bool> listenToSessionActivationStatus() {
    return stream.listenToSessionActivationStatus();
  }

  @override
  initializeSession() async => await queries.initializeSession();

  @override
  joinSession(String leaderUID) async => await queries.joinSession(leaderUID);

  @override
  nukeSession() async => await queries.nukeSession();
}
