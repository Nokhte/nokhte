import 'constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserInformationQueries with UserInformationConstants {
  final SupabaseClient supabase;
  String userUID;

  UserInformationQueries({
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

  Future<List> updateHasAccessedQrCode(
    bool hasGoneThroughInvitationFlow,
  ) async {
    final getRes = await getUserInfo();
    if (getRes.first[HAS_ACCESSED_QR_CODE] == hasGoneThroughInvitationFlow) {
      return getRes;
    } else {
      return await supabase
          .from(TABLE)
          .update({
            HAS_ACCESSED_QR_CODE: hasGoneThroughInvitationFlow,
          })
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> updateHasEnteredStorage(bool hasEnteredStorage) async {
    final getRes = await getUserInfo();
    if (getRes.first[HAS_ENTERED_STORAGE] == hasEnteredStorage) {
      return getRes;
    } else {
      return await supabase
          .from(TABLE)
          .update({
            HAS_ENTERED_STORAGE: hasEnteredStorage,
          })
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> getCollaboratorRows() async =>
      await supabase.from(TABLE).select().neq('uid', userUID);
}
