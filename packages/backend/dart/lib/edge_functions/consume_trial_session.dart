import 'package:supabase_flutter/supabase_flutter.dart';

class ConsumeTrialSession {
  final SupabaseClient supabase;
  final String userUID;

  ConsumeTrialSession({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  invoke() async => await supabase.functions.invoke(
        "consume-trial-session",
        body: {
          'userUID': userUID,
        },
      );
}
