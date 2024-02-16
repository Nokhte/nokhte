import 'constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserNamesQueries with UserNamesConstants {
  final SupabaseClient supabase;
  String userUID;

  UserNamesQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insertUserInfo({
    required String firstName,
    required String lastName,
  }) async =>
      await supabase.from(TABLE).insert({
        UID: userUID,
        FIRST_NAME: firstName,
        LAST_NAME: lastName,
      }).select();

  Future<List> getUserInfo() async =>
      await supabase.from(TABLE).select().eq(UID, userUID);

  Future<List> deleteUserInfo() async =>
      await supabase.from(TABLE).delete().eq(UID, userUID).select();

  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitation) async {
    final getRes = await getUserInfo();
    if (getRes.first[HAS_SENT_AN_INVITATION] == hasSentAnInvitation) {
      return getRes;
    } else {
      return await supabase
          .from(TABLE)
          .update({
            HAS_SENT_AN_INVITATION: hasSentAnInvitation,
          })
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> updateHasGoneThroughInvitationFlow(
    bool hasGoneThroughInvitationFlow,
  ) async {
    final getRes = await getUserInfo();
    if (getRes.first[HAS_GONE_THROUGH_INVITATION_FLOW] ==
        hasGoneThroughInvitationFlow) {
      return getRes;
    } else {
      return await supabase
          .from(TABLE)
          .update({
            HAS_GONE_THROUGH_INVITATION_FLOW: hasGoneThroughInvitationFlow,
          })
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlow) async {
    final getRes = await getUserInfo();
    if (getRes.first[WANTS_TO_REPEAT_INVITATION_FLOW] ==
        wantsToRepeatInvitationFlow) {
      return getRes;
    } else {
      return await supabase
          .from(TABLE)
          .update({
            WANTS_TO_REPEAT_INVITATION_FLOW: wantsToRepeatInvitationFlow,
          })
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> getCollaboratorRows() async =>
      await supabase.from(TABLE).select().neq('uid', userUID);
}
