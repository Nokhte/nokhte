import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/tables/active_monetization_sessions.dart';

abstract class ActiveMonetizationSessionRemoteSource {
  Future<List> startMonetizationSession();
  Future<List> updateHasFinishedExplanation();
  Stream<bool> listenToExplanationCompletionStatus();
  bool disposeExplanationCompletionStatusStream();
  Future<List> deleteMonetizationSession();
}

class ActiveMonetizationSessionRemoteSourceImpl
    implements ActiveMonetizationSessionRemoteSource {
  final SupabaseClient supabase;
  final ActiveMonetizationSessionsStream stream;
  final ActiveMonetizationSessionQueries queries;

  ActiveMonetizationSessionRemoteSourceImpl({
    required this.supabase,
  })  : stream = ActiveMonetizationSessionsStream(supabase: supabase),
        queries = ActiveMonetizationSessionQueries(supabase: supabase);

  @override
  listenToExplanationCompletionStatus() =>
      stream.listenToExplanationCompletionStatus();

  @override
  startMonetizationSession() async => await queries.startSession();

  @override
  updateHasFinishedExplanation() async =>
      await queries.updateHasFinishedExplanation();

  @override
  disposeExplanationCompletionStatusStream() =>
      stream.cancelExplanationCompletionStatus();

  @override
  deleteMonetizationSession() async => await queries.deleteSession();
}
