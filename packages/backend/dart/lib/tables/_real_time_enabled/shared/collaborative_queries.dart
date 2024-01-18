import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborativeQueries {
  static const collaboratorONE = "collaborator_one";
  static const collaboratorTWO = "collaborator_two";
  static const isCurrentlyActive = "is_currently_active";
  static const isConsecrated = "is_consecrated";
  final SupabaseClient supabase;
  String currentUserUID = '';
  CollaboratorInfo collaboratorInfo = CollaboratorInfo(
    theCollaboratorsNumber: '',
    theCollaboratorsUID: '',
    theUsersCollaboratorNumber: '',
    theUsersUID: '',
  );

  CollaborativeQueries({
    required this.supabase,
  }) {
    currentUserUID = supabase.auth.currentUser?.id ?? '';
    supabase.storage.setAuth(supabase.auth.currentSession?.accessToken ?? '');
  }

  Future<void> ensureActiveCollaboratorInfo() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      collaboratorInfo = await _computeActiveCollaboratorInfo();
    }
  }

  Future<CollaboratorInfo> _computeActiveCollaboratorInfo() async {
    final res = await getActiveCollaboratorsUIDAndNumber();
    return CollaboratorInfo(
      theCollaboratorsNumber: res[1] == 1 ? collaboratorONE : collaboratorTWO,
      theCollaboratorsUID: res.first,
      theUsersCollaboratorNumber:
          res[1] == 1 ? collaboratorTWO : collaboratorONE,
      theUsersUID: currentUserUID,
    );
  }

  Future<List> getActiveCollaboratorsUIDAndNumber() async {
    final collabRes = await getCollaborations(filterForIsActive: true);
    final collaboratorOneRes = collabRes.first[collaboratorONE];
    final collaboratorTwoRes = collabRes.first[collaboratorTWO];
    return collaboratorOneRes == currentUserUID
        ? [collaboratorTwoRes, 2]
        : [collaboratorOneRes, 1];
  }

  Future<List<dynamic>> getCollaborations({
    bool filterForIsActive = false,
    bool filterForUnconsecrated = false,
  }) async {
    final List res = await supabase.from("existing_collaborations").select().or(
        '$collaboratorONE.eq.$currentUserUID,$collaboratorTWO.eq.$currentUserUID');
    if (filterForIsActive && !filterForUnconsecrated) {
      res.removeWhere((element) => element[isCurrentlyActive] == false);
    } else if (filterForUnconsecrated && !filterForIsActive) {
      res.removeWhere((element) => element[isConsecrated] == true);
    }
    return res;
  }

  onCurrentActiveCollaboration(PostgrestFilterBuilder theQuery) {
    return theQuery
        .eq(isCurrentlyActive, true)
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        )
        .select();
  }

  int getIndexForCollaboratorNumber(String collaboratorNumber) =>
      collaboratorNumber == collaboratorONE ? 0 : 1;
}
