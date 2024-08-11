import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

abstract class UserInformationRemoteSource {
  Future<List> updatePreferredPreset(String presetUID);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateUserFlag(UserFlagParam newEntryStatus);
  Future<bool> versionIsUpToDate();
  Future<List> getPreferredPreset();
}

class UserInformationRemoteSourceImpl implements UserInformationRemoteSource {
  final SupabaseClient supabase;
  final UserInformationQueries userInfoQueries;
  final FinishedNokhteSessionQueries finishedNokhteSessionQueries;

  UserInformationRemoteSourceImpl({required this.supabase})
      : userInfoQueries = UserInformationQueries(supabase: supabase),
        finishedNokhteSessionQueries =
            FinishedNokhteSessionQueries(supabase: supabase);

  @override
  updatePreferredPreset(String presetUID) async =>
      await userInfoQueries.updatePreferredPreset(presetUID);

  @override
  getUserInfo() async => await userInfoQueries.getUserInfo();

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  updateUserFlag(params) async =>
      await userInfoQueries.updateUserFlag(params.keyStr, params.value);

  @override
  versionIsUpToDate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return (await supabase.rpc('get_valid_app_versions')).contains(version);
  }

  @override
  Future<List> getPreferredPreset() async =>
      await userInfoQueries.getPreferredPresetInfo();
}
