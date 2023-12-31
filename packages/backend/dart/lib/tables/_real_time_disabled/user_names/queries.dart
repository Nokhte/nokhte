import 'package:supabase_flutter/supabase_flutter.dart';

class UserNamesQueries {
  static String get tableName => 'user_names';
  static String get firstName => 'first_name';
  static String get lastName => 'last_name';
  static String get uid => 'uid';
  static String get hasSentAnInvitation => 'has_sent_an_invitation';
  static String get hasGoneThroughInvitationFlow =>
      'has_gone_through_invitation_flow';
  static String get wantsToRepeatInvitationFlow =>
      'wants_to_repeat_invitation_flow';
  final SupabaseClient supabase;
  String userUID;

  UserNamesQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insertUserInfo({
    required String firstNameParam,
    required String lastNameParam,
  }) async =>
      await supabase.from(tableName).insert({
        uid: userUID,
        firstName: firstNameParam,
        lastName: lastNameParam,
      }).select();

  Future<List> getUserInfo() async =>
      await supabase.from(tableName).select().eq(uid, userUID);

  Future<List> deleteUserInfo() async =>
      await supabase.from(tableName).delete().eq(uid, userUID).select();

  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam) async {
    final getRes = await getUserInfo();
    if (getRes.first[hasSentAnInvitation] == hasSentAnInvitationParam) {
      return getRes;
    } else {
      return await supabase
          .from(tableName)
          .update({
            hasSentAnInvitation: hasSentAnInvitationParam,
          })
          .eq(uid, userUID)
          .select();
    }
  }

  Future<List> updateHasGoneThroughInvitationFlow(
    bool hasGoneThroughInvitationFlowParam,
  ) async {
    final getRes = await getUserInfo();
    if (getRes.first[hasGoneThroughInvitationFlow] ==
        hasGoneThroughInvitationFlowParam) {
      return getRes;
    } else {
      return await supabase
          .from(tableName)
          .update({
            hasGoneThroughInvitationFlow: hasGoneThroughInvitationFlowParam,
          })
          .eq(uid, userUID)
          .select();
    }
  }

  Future<List> updateWantsToRepeatInvitationFlow(
    bool wantsToRepeatInvitationFlowParam,
  ) async {
    final getRes = await getUserInfo();
    if (getRes.first[wantsToRepeatInvitationFlow] ==
        wantsToRepeatInvitationFlowParam) {
      return getRes;
    } else {
      return await supabase
          .from(tableName)
          .update({
            wantsToRepeatInvitationFlow: wantsToRepeatInvitationFlowParam,
          })
          .eq(uid, userUID)
          .select();
    }
  }
}
