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
      await supabase.from(UserNamesConstants.TABLE).insert({
        UserNamesConstants.UID: userUID,
        UserNamesConstants.FIRST_NAME: firstName,
        UserNamesConstants.LAST_NAME: lastName,
      }).select();

  Future<List> getUserInfo() async => await supabase
      .from(UserNamesConstants.TABLE)
      .select()
      .eq(UserNamesConstants.UID, userUID);

  Future<List> deleteUserInfo() async => await supabase
      .from(UserNamesConstants.TABLE)
      .delete()
      .eq(UserNamesConstants.UID, userUID)
      .select();

  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitation) async {
    final getRes = await getUserInfo();
    if (getRes.first[UserNamesConstants.HAS_SENT_AN_INVITATION] ==
        hasSentAnInvitation) {
      return getRes;
    } else {
      return await supabase
          .from(UserNamesConstants.TABLE)
          .update({
            UserNamesConstants.HAS_SENT_AN_INVITATION: hasSentAnInvitation,
          })
          .eq(UserNamesConstants.UID, userUID)
          .select();
    }
  }

  Future<List> updateHasGoneThroughInvitationFlow(
    bool hasGoneThroughInvitationFlow,
  ) async {
    final getRes = await getUserInfo();
    if (getRes.first[UserNamesConstants.HAS_GONE_THROUGH_INVITATION_FLOW] ==
        hasGoneThroughInvitationFlow) {
      return getRes;
    } else {
      return await supabase
          .from(UserNamesConstants.TABLE)
          .update({
            UserNamesConstants.HAS_GONE_THROUGH_INVITATION_FLOW:
                hasGoneThroughInvitationFlow,
          })
          .eq(UserNamesConstants.UID, userUID)
          .select();
    }
  }

  Future<List> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlow) async {
    final getRes = await getUserInfo();
    if (getRes.first[UserNamesConstants.WANTS_TO_REPEAT_INVITATION_FLOW] ==
        wantsToRepeatInvitationFlow) {
      return getRes;
    } else {
      return await supabase
          .from(UserNamesConstants.TABLE)
          .update({
            UserNamesConstants.WANTS_TO_REPEAT_INVITATION_FLOW:
                wantsToRepeatInvitationFlow,
          })
          .eq(UserNamesConstants.UID, userUID)
          .select();
    }
  }

  Future<List> getCollaboratorRows() async => await supabase
      .from(UserNamesConstants.TABLE)
      .select()
      .neq('uid', userUID);
}
