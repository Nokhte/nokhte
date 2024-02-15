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

class PosthogRemoteSourceImpl
    with PosthogEventConstants, PosthogPageNameConstants
    implements PosthogRemoteSource {
  final SupabaseClient supabase;
  final Posthog posthog;

  PosthogRemoteSourceImpl({required this.supabase}) : posthog = Posthog();

  @override
  Future<void> captureNokhteSessionEnd() async {
    await Posthog().capture(eventName: END_NOKHTE_SESSION, properties: {
      "time": DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> captureNokhteSessionStart() async {
    await Posthog().capture(eventName: START_NOKHTE_SESSION, properties: {
      "time": DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> captureShareNokhteSessionInvitation() async {
    await posthog.capture(eventName: SHARE_NOKHTE_SESSION_INVITATION);
  }

  @override
  Future<void> identifyUser() async {
    await posthog.identify(userId: supabase.auth.currentUser!.id);
  }

  @override
  Future<void> captureScreen(Screens screen) async {
    await posthog.capture(eventName: getScreenName(screen));
  }
}
