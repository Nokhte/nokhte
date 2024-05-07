import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserInformationRemoteSource {
  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam);
  Future<List> updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlowParam);
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
  Future<List> updateHasGoneThroughInvitationFlow(
          bool hasGoneThroughInvitationFlowParam) async =>
      await userNamesQueries.updateHasGoneThroughInvitationFlow(
          hasGoneThroughInvitationFlowParam);

  @override
  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam) async =>
      await userNamesQueries
          .updateHasSentAnInvitation(hasSentAnInvitationParam);

  @override
  Future<List> getUserInfo() async => await userNamesQueries.getUserInfo();

  @override
  Future<List> updateWantsToRepeatInvitationFlow(
          bool wantsToRepeatInvitationFlowParam) async =>
      await userNamesQueries
          .updateWantsToRepeatInvitationFlow(wantsToRepeatInvitationFlowParam);

  @override
  getFinishedNokhteSessions() async =>
      await finishedNokhteSessionQueries.select();

  @override
  Future<List> updateHasEnteredStorage(bool newEntryStatus) async =>
      await userNamesQueries.updateHasEnteredStorage(newEntryStatus);
}
