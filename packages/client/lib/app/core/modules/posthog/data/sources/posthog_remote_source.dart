import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PosthogRemoteSource {
  Future<void> identifyUser();
  Future<void> captureNokhteSessionStart(int numberOfCollaborators);
  Future<void> captureNokhteSessionEnd();
  Future<void> captureScreen(String screenRoute);
}

class PosthogRemoteSourceImpl
    with PosthogEventConstants
    implements PosthogRemoteSource {
  String formatRoute(String input) {
    if (input.startsWith('/')) {
      input = input.substring(1);
    }
    if (input.endsWith('/')) {
      input = input.substring(0, input.length - 1);
    }
    return "\$${input}_screen";
  }

  final Posthog posthog = Posthog();

  @override
  Future<void> captureNokhteSessionEnd() async {
    await Posthog().capture(eventName: END_NOKHTE_SESSION, properties: {
      "sent_at": DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> captureNokhteSessionStart(
    int numberOfCollaborators,
  ) async {
    await Posthog().capture(eventName: STARTED_NOKHTE_SESSION, properties: {
      "sent_at": DateTime.now().toIso8601String(),
      "number_of_collaborators": numberOfCollaborators,
    });
  }

  @override
  Future<void> identifyUser() async {
    final supabase = Supabase.instance.client;
    await posthog.identify(userId: supabase.auth.currentUser!.id);
  }

  @override
  Future<void> captureScreen(String screenRoute) async {
    await posthog.capture(eventName: formatRoute(screenRoute));
  }
}
