import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserInformationRemoteSource {
  Future<List> updateHasAccessedQrCode(bool hasGoneThroughInvitationFlowParam);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateHasEnteredStorage(bool newEntryStatus);
  Future<bool> versionIsUpToDate();
}

class UserInformationRemoteSourceImpl implements UserInformationRemoteSource {
  final SupabaseClient supabase;
  final UserInformationQueries userNamesQueries;
  final FinishedNokhteSessionQueries finishedNokhteSessionQueries;

  UserInformationRemoteSourceImpl({required this.supabase})
      : userNamesQueries = UserInformationQueries(supabase: supabase),
        finishedNokhteSessionQueries =
            FinishedNokhteSessionQueries(supabase: supabase);

  @override
  updateHasAccessedQrCode(bool hasGoneThroughInvitationFlowParam) async =>
      await userNamesQueries
          .updateHasAccessedQrCode(hasGoneThroughInvitationFlowParam);

  @override
  getUserInfo() async => await userNamesQueries.getUserInfo();

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  updateHasEnteredStorage(bool newEntryStatus) async =>
      await userNamesQueries.updateHasEnteredStorage(newEntryStatus);

  @override
  versionIsUpToDate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return (await supabase.rpc('get_valid_app_versions')).contains(version);
  }
}
