import 'package:nokhte/app/core/modules/timer/domain/logic/create_timer.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TimerRemoteSource {
  Future<List> createTimer(CreateTimerParams params);
// Future<> ();
// Future<> ();
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
  Future<List> createTimer(CreateTimerParams params) async =>
      await queries.createNewTimer(
        timerLengthInMilliseconds: params.toMilliseconds(),
      );
}
