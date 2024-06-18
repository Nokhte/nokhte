import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserInformationRemoteSource {
  Future<List> updatePreferredPreset(String presetUID);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateHasEnteredStorage(bool newEntryStatus);
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

  // final res = await userInfoQueries.getPreferredPresetInfo();
  // print(res);
  @override
  getUserInfo() async => await userInfoQueries.getUserInfo();

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  updateHasEnteredStorage(bool newEntryStatus) async =>
      await userInfoQueries.updateHasEnteredStorage(newEntryStatus);

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
