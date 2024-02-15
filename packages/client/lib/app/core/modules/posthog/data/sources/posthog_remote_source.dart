import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PosthogRemoteSource {
  Future<void> identifyUser();
  Future<void> captureNokhteSessionStart();
  Future<void> captureNokhteSessionEnd();
  Future<void> captureShareNokhteSessionInvitation();
  Future<void> captureScreen(Screens screen);
}
