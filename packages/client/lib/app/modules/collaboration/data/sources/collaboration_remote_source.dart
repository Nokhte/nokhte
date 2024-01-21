import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborationRemoteSource {
  Future<FunctionResponse> enterThePool(String collaboratorUID);

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
  enterThePool(String collaboratorUID) async =>
      await initiateCollaboratorSearch.invoke(collaboratorUID);

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
