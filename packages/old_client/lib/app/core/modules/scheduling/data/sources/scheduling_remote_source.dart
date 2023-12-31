import 'package:flutter/foundation.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';
import 'package:nokhte_core/custom_control_structures.dart';
import 'package:nokhte_core/types/types.dart';
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
    await queries.figureOutActiveCollaboratorInfoIfNotDoneAlready();
    const chosenCollaboratorNumber =
        kDebugMode ? CollaboratorNumbers.two : CollaboratorNumbers.one;
    return await StringComparison.isCollaborator(
        chosenCollaboratorNumber: chosenCollaboratorNumber,
        input: queries.collaboratorInfo.theUsersCollaboratorNumber,
        callback: () async => await queries.createSchedulingSession(
            sessionTypeBeingPlanned: 'collective'),
        elseReturnVal: []);
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
