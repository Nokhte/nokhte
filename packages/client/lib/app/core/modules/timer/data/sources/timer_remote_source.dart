import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
import 'package:nokhte_core/custom_control_structures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TimerRemoteSource {
  Future<List> createTimer(CreateTimerParams params);
  Future<List> updatePresence(bool isPresent);
  Future<List> updateTimerRunningStatus(bool shouldBeRunning);
  Future<void> deleteTheTimer(NoParams params);
  Future<void> markdownTheTimer(NoParams params);
  Stream<PresenceAndTimeRemaining> getTimerInformationStream(NoParams params);
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
    if (queries.collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await queries.figureOutActiveCollaboratorInfo();
    }
    final userCollaboratorNumber =
        queries.collaboratorInfo.theUsersCollaboratorNumber;
    return await StringComparison.isCollaboratorTwo(
        input: userCollaboratorNumber,
        elseReturnVal: [],
        callback: () async {
          return await queries.createNewTimer(
            timerLengthInMilliseconds: params.toMilliseconds(),
          );
        });
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
  Stream<PresenceAndTimeRemaining> getTimerInformationStream(NoParams params) =>
      stream.getStream();
}
