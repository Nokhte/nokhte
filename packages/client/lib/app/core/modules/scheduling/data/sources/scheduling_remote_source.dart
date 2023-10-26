import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte_backend/working_collaborative_scheduling.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SchedulingRemoteSource {
  Future<List> createSchedulingSession();
  Future<void> updateShedulingTimeOrDate(
    UpdateSchedulingTimeOrDateParams params,
  );
  Stream<CollaboratorsDateAndTime> getCollaboratorsDateAndTime();
}

class SchedulingRemoteSourceImpl implements SchedulingRemoteSource {
  final SupabaseClient supabase;
  final WorkingCollaborativeSchedulingQueries queries;
  final WorkingCollaborativeSchedulingStream stream;
  SchedulingRemoteSourceImpl({required this.supabase})
      : queries = WorkingCollaborativeSchedulingQueries(supabase: supabase),
        stream = WorkingCollaborativeSchedulingStream(supabase: supabase);

  @override
  Future<List> createSchedulingSession() async {
    return await queries.createSchedulingSession(
        sessionTypeBeingPlanned: 'collective');
  }

  @override
  Future<void> updateShedulingTimeOrDate(params) async {
    return await queries.updateTimeOrDate(params.newDateOrTime,
        updateDate: params.updateDate);
  }

  @override
  Stream<CollaboratorsDateAndTime> getCollaboratorsDateAndTime() {
    return stream.collaboratorsDateAndTimeStream();
  }
}
