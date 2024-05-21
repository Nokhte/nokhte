import 'package:nokhte_backend/tables/active_monetization_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveMonetizationSessionQueries with ActiveMonetizationSessionConstants {
  final SupabaseClient supabase;
  final String userUID;
  ActiveMonetizationSessionQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> select() async => await supabase.from(TABLE).select();

  Future<List> startSession() async {
    final res = (await supabase.from("active_nokhte_sessions").select());
    if (res.isNotEmpty) {
      final collaboratorUIDs = res[0][COLLABORATOR_UIDS];
      final hasPremiumAccess = res[0]["has_premium_access"];
      return await supabase.from(TABLE).insert({
        COLLABORATOR_UIDS: collaboratorUIDs,
        HAVE_FINISHED_EXPLANATIONS: hasPremiumAccess,
      }).select();
    } else {
      return [];
    }
  }

  Future<List> updateHasFinishedExplanation() async {
    final res = await select();
    if (res.isNotEmpty) {
      final hasFinishedExplanations = res.first[HAVE_FINISHED_EXPLANATIONS];
      final userIndex = res.first[COLLABORATOR_UIDS].indexOf(userUID);
      hasFinishedExplanations[userIndex] = true;
      return await supabase
          .from(TABLE)
          .update({HAVE_FINISHED_EXPLANATIONS: hasFinishedExplanations})
          .contains(COLLABORATOR_UIDS, '{$userUID}')
          .select();
    } else {
      return [];
    }
  }

  Future<List> deleteSession() async => await supabase
      .from(TABLE)
      .delete()
      .contains(COLLABORATOR_UIDS, '{$userUID}')
      .select();
}
