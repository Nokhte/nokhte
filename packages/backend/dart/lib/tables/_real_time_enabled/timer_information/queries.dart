import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class TimerInformationQueries extends CollaborativeQueries {
  static const tableName = "timer_information";
  static const isOnline = "is_online";
  static const timerIsRunning = "timer_is_running";
  static const timeRemainingInMilliseconds = "time_remaining_in_milliseconds";

  TimerInformationQueries({required super.supabase});
}
