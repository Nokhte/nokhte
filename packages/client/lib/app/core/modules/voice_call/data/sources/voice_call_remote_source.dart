import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

abstract class VoiceCallRemoteSource {
  Future<String> getMeetingId();

  Future<String> getMeetingToken();

  String getUserUID();
}

class VoiceCallRemoteSourceImpl implements VoiceCallRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries queries;
  final String currentUserUID;

  VoiceCallRemoteSourceImpl({
    required this.supabase,
  })  : currentUserUID = supabase.auth.currentUser?.id ?? '',
        queries = ExistingCollaborationsQueries(supabase: supabase);

  @override
  Future<String> getMeetingId() async => await queries.getMeetingId();

  @override
  Future<String> getMeetingToken() async => await queries.getMeetingToken();

  @override
  String getUserUID() => currentUserUID;
}
