import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborativeQueries {
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

  Future<void> figureOutActiveCollaboratorInfo() async {
    collaboratorInfo = await computeActiveCollaboratorInfo();
  }

  Future<CollaboratorInfo> computeActiveCollaboratorInfo() async {
    final res = await getActiveCollaboratorsUIDAndNumber();
    return res[1] == 1
        ? CollaboratorInfo(
            theCollaboratorsNumber: 'collaborator_one',
            theCollaboratorsUID: res.first,
            theUsersCollaboratorNumber: 'collaborator_two',
            theUsersUID: currentUserUID,
          )
        : CollaboratorInfo(
            theCollaboratorsNumber: 'collaborator_two',
            theCollaboratorsUID: res.first,
            theUsersCollaboratorNumber: 'collaborator_one',
            theUsersUID: currentUserUID,
          );
  }

  Future<List<dynamic>> getActiveCollaborationInfo() async {
    return await supabase
        .from("existing_collaborations")
        .select()
        .or('collaborator_one.eq.$currentUserUID,collaborator_two.eq.$currentUserUID')
        .eq('is_currently_active', true);
  }

  Future<List> getActiveCollaboratorsUIDAndNumber() async {
    final collabRes = await getActiveCollaborationInfo();
    final collaboratorOne = collabRes.first["collaborator_one"];
    final collaboratorTwo = collabRes.first["collaborator_two"];
    return collaboratorOne == currentUserUID
        ? [collaboratorTwo, 2]
        : [collaboratorOne, 1];
  }

  Future<List<dynamic>> getAllCollaborationInfo() async {
    return await supabase.from("existing_collaborations").select().or(
        'collaborator_one.eq.$currentUserUID,collaborator_two.eq.$currentUserUID');
  }
}
