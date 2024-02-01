import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NokhteSessionRemoteSource {
  Future<bool> checkifUserHasTheQuestion();
}
