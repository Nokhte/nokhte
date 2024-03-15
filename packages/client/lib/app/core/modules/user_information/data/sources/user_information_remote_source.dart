import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserInformationRemoteSource {
  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam);
  Future<List> updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam);
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
  Future<List> updateWantsToRepeatInvitationFlow(
      bool wantsToRepeatInvitationFlowParam);
}

class UserInformationRemoteSourceImpl implements UserInformationRemoteSource {
  final SupabaseClient supabase;
  final UserNamesQueries userNamesQueries;
  final FinishedNokhteSessionQueries finishedNokhteSessionQueries;

  UserInformationRemoteSourceImpl({required this.supabase})
      : userNamesQueries = UserNamesQueries(supabase: supabase),
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
}
