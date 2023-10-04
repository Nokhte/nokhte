import 'package:primala_backend/working_collaborative_scheduling.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SchedulingRemoteSource {
  Future<List> createSchedulingSession();
}

class SchedulingRemoteSourceImpl implements SchedulingRemoteSource {
  final SupabaseClient supabase;
  final WorkingCollaborativeSchedulingQueries queries;
  SchedulingRemoteSourceImpl({required this.supabase})
      : queries = WorkingCollaborativeSchedulingQueries(supabase: supabase);

  @override
  Future<List> createSchedulingSession() async {
    return queries.createSchedulingSession(
        sessionTypeBeingPlanned: 'collaborative');
  }
}
