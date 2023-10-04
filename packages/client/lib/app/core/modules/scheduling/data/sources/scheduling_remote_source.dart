import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala_backend/working_collaborative_scheduling.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SchedulingRemoteSource {
  Future<List> createSchedulingSession();
  Future<void> updateShedulingTimeOrDate(
    UpdateSchedulingTimeOrDateParams params,
  );
}

class SchedulingRemoteSourceImpl implements SchedulingRemoteSource {
  final SupabaseClient supabase;
  final WorkingCollaborativeSchedulingQueries queries;
  SchedulingRemoteSourceImpl({required this.supabase})
      : queries = WorkingCollaborativeSchedulingQueries(supabase: supabase);

  @override
  Future<List> createSchedulingSession() async {
    return await queries.createSchedulingSession(
        sessionTypeBeingPlanned: 'collaborative');
  }

  @override
  Future<void> updateShedulingTimeOrDate(params) async {
    return await queries.updateTimeOrDate(params.newDateOrTime,
        updateDate: params.updateDate);
  }
}
