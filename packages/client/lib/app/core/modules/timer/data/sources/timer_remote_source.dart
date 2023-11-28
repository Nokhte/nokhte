import 'package:flutter/foundation.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/data/sources/delete_the_timer_remote_source_interface.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
import 'package:nokhte_core/custom_control_structures.dart';
import 'package:nokhte_core/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TimerRemoteSource with DeleteTheTimerRemoteSourceInterface {
  Future<List> createTimer(CreateTimerParams params);
  Future<List> updatePresence(bool isPresent);
  Future<List> updateTimerRunningStatus(bool shouldBeRunning);

  Future<void> markdownTheTimer(NoParams params);
  Stream<PresenceAndTimerCompletion> getTimerInformationStream(NoParams params);
}

class TimerRemoteSourceImpl implements TimerRemoteSource {
  final SupabaseClient supabase;
  final TimerInformationQueries queries;
  final TimerInformationStreams stream;

  TimerRemoteSourceImpl({
    required this.supabase,
  })  : queries = TimerInformationQueries(supabase: supabase),
        stream = TimerInformationStreams(supabase: supabase);

  @override
  Future<List> createTimer(CreateTimerParams params) async {
    await queries.figureOutActiveCollaboratorInfoIfNotDoneAlready();
    const chosenCollaboratorNumber =
        kDebugMode ? CollaboratorNumbers.one : CollaboratorNumbers.two;
    return await StringComparison.isCollaborator(
        chosenCollaboratorNumber: chosenCollaboratorNumber,
        input: queries.collaboratorInfo.theUsersCollaboratorNumber,
        callback: () async => await queries.createNewTimer(
            timerLengthInMilliseconds: params.toMilliseconds()),
        elseReturnVal: []);
  }

  @override
  Future<List> updatePresence(bool isPresent) async =>
      await queries.updatePresence(isOnlineParam: isPresent);

  @override
  Future<List> updateTimerRunningStatus(bool shouldBeRunning) async =>
      await queries.updateTimerRunningStatus(newTimerStatus: shouldBeRunning);

  @override
  Future<void> deleteTheTimer(NoParams params) async =>
      await queries.deleteTheTimer();

  @override
  Future<void> markdownTheTimer(NoParams params) async =>
      await queries.markDownTheTimer();

  @override
  Stream<PresenceAndTimerCompletion> getTimerInformationStream(
          NoParams params) =>
      stream.getStream();
}
