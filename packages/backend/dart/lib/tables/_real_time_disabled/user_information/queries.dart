import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/unified_presets/constants.dart';

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

  Future<List> updatePreferredPreset(
    String presetUID,
  ) async {
    return await supabase
        .from(TABLE)
        .update({PREFERRED_PRESET: presetUID})
        .eq(UID, userUID)
        .select();
  }

  Future<String?> getPreferredPresetUID() async {
    final res = await supabase.from(TABLE).select().eq(UID, userUID);
    if (res.isNotEmpty) {
      return res.first[PREFERRED_PRESET];
    } else {
      return '';
    }
  }

  Future<List> getPreferredPresetInfo() async =>
      await supabase.from(TABLE).select('''
        $PREFERRED_PRESET, ${UnifiedPresetsConstants.TABLE}(
          ${UnifiedPresetsConstants.COMPANY_PRESET_ID}, ${UnifiedPresetsConstants.UID},
           ${CompanyPresetsQueries.TABLE}(*))
           ''').eq(UID, userUID);

  Future<List> updateUserFlag(String key, bool value) async {
    final getRes = await getUserInfo();
    final Map flags = getRes.first[FLAGS];
    if (flags[key] == value) {
      return getRes;
    } else {
      flags[key] = value;
      return await supabase
          .from(TABLE)
          .update({FLAGS: flags})
          .eq(UID, userUID)
          .select();
    }
  }

  Future<List> getCollaboratorRows() async =>
      await supabase.from(TABLE).select().neq('uid', userUID);
}
