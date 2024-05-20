import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserInformationRemoteSource {
  Future<List> updateHasAccessedQrCode(bool hasGoneThroughInvitationFlowParam);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateHasEnteredStorage(bool newEntryStatus);
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
  Future<List> updateHasAccessedQrCode(
          bool hasGoneThroughInvitationFlowParam) async =>
      await userNamesQueries
          .updateHasAccessedQrCode(hasGoneThroughInvitationFlowParam);

  @override
  Future<List> getUserInfo() async => await userNamesQueries.getUserInfo();

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  Future<List> updateHasEnteredStorage(bool newEntryStatus) async =>
      await userNamesQueries.updateHasEnteredStorage(newEntryStatus);
}
