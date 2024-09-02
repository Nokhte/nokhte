import 'package:hive_flutter/hive_flutter.dart';
import 'package:nokhte/app/core/modules/hive/hive.dart';
import 'package:nokhte/app/core/modules/hive/mixin/mixin.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
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

class UserInformationRemoteSourceImpl
    with HiveBoxUtils, UserInformationConstants
    implements UserInformationRemoteSource {
  final SupabaseClient supabase;
  final UserInformationQueries userInfoQueries;
  final FinishedNokhteSessionQueries finishedNokhteSessionQueries;
  final CompanyPresetsQueries companyPresetQueries;
  final userInfoBox = HiveBoxes.userInformation.toString();

  UserInformationRemoteSourceImpl({required this.supabase})
      : userInfoQueries = UserInformationQueries(supabase: supabase),
        companyPresetQueries = CompanyPresetsQueries(supabase: supabase),
        finishedNokhteSessionQueries =
            FinishedNokhteSessionQueries(supabase: supabase);

  @override
  getUserInfo() async => await initBoxIfNecessary(
        name: userInfoBox,
        query: () async => await userInfoQueries.getUserInfo(),
      );

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  updatePreferredPreset(String presetUID) async {
    final res = await userInfoQueries.updatePreferredPreset(presetUID);
    return await updateBox(data: res.first, name: userInfoBox);
  }

  @override
  updateUserFlag(params) async {
    final res =
        await userInfoQueries.updateUserFlag(params.keyStr, params.value);
    return await updateBox(data: res.first, name: userInfoBox);
  }

  @override
  versionIsUpToDate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return (await supabase.rpc('get_valid_app_versions')).contains(version);
  }

  @override
  Future<List> getPreferredPreset() async {
    final box = await Hive.openBox(userInfoBox);
    final res = await companyPresetQueries.getInfoFromUnifiedUID(
      box.get(PREFERRED_PRESET),
    );
    return res;
  }
}
