import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class OneTalkerAtATimeRemoteSource {
  Future<List> setUserAsCurrentTalker();
  Future<void> clearTheCurrentTalker();
  Stream<bool> checkIfCollaboratorIsTalking();
}

class OneTalkerAtATimeRemoteSourceImpl implements OneTalkerAtATimeRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries queries;
  final ExistingCollaborationsStream stream;

  OneTalkerAtATimeRemoteSourceImpl({
    required this.supabase,
  })  : queries = ExistingCollaborationsQueries(supabase: supabase),
        stream = ExistingCollaborationsStream(supabase: supabase);

  @override
  Stream<bool> checkIfCollaboratorIsTalking() => Stream.empty();
  // stream.checkIfCollaboratorIsTalking();

  @override
  Future<void> clearTheCurrentTalker() async =>
      await queries.clearTheCurrentTalker();

  @override
  Future<List> setUserAsCurrentTalker() async =>
      await queries.setUserAsTheCurrentTalker();
}
