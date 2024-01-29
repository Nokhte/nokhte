import 'package:nokhte/app/modules/collaboration/domain/logic/enter_collaborator_pool.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborationRemoteSource {
  Future<FunctionResponse> enterThePool(EnterCollaboratorPoolParams params);

  Future<FunctionResponse> exitThePool();

  Stream<bool> getCollaboratorSearchStatus();

  bool cancelStream();
}

class CollaborationRemoteSourceImpl implements CollaborationRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final ExistingCollaborationsStream existingCollaborationsStream;
  final InitiateCollaboratorSearch initiateCollaboratorSearch;
  final EndCollaboratorSearch endCollaboratorSearch;

  CollaborationRemoteSourceImpl({
    required this.supabase,
  })  : initiateCollaboratorSearch =
            InitiateCollaboratorSearch(supabase: supabase),
        endCollaboratorSearch = EndCollaboratorSearch(supabase: supabase),
        existingCollaborationsStream =
            ExistingCollaborationsStream(supabase: supabase),
        currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  enterThePool(params) async => await initiateCollaboratorSearch.invoke(
      params.collaboratorUID, params.invitationType);

  @override
  Future<FunctionResponse> exitThePool() async =>
      await endCollaboratorSearch.invoke();

  @override
  Stream<bool> getCollaboratorSearchStatus() =>
      existingCollaborationsStream.getCollaboratorSearchAndEntryStatus();

  @override
  bool cancelStream() =>
      existingCollaborationsStream.cancelGetCollaboratorSearchStream();
}
