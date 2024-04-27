import 'package:nokhte/app/modules/session_starters/domain/logic/enter_collaborator_pool.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionStartersRemoteSource {
  Future<FunctionResponse> enterThePool(EnterCollaboratorPoolParams params);

  Future<FunctionResponse> exitThePool();

  Stream<bool> getNokhteSessionSearchStatus();

  bool cancelNokhteSessionSearchStream();
}

class SessionStartersRemoteSourceImpl implements SessionStartersRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final InitiateCollaboratorSearch initiateCollaboratorSearch;
  final EndCollaboratorSearch endCollaboratorSearch;
  final ActiveIrlNokhteSessionsStream activeNokhteSessionsStream;

  SessionStartersRemoteSourceImpl({
    required this.supabase,
  })  : initiateCollaboratorSearch =
            InitiateCollaboratorSearch(supabase: supabase),
        endCollaboratorSearch = EndCollaboratorSearch(supabase: supabase),
        activeNokhteSessionsStream =
            ActiveIrlNokhteSessionsStream(supabase: supabase),
        currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  enterThePool(params) async => await initiateCollaboratorSearch.invoke(
      params.collaboratorUID, params.invitationType);

  @override
  Future<FunctionResponse> exitThePool() async =>
      await endCollaboratorSearch.invoke();

  @override
  bool cancelNokhteSessionSearchStream() =>
      activeNokhteSessionsStream.cancelGetActiveNokhteSessionCreationStatus();

  @override
  Stream<bool> getNokhteSessionSearchStatus() {
    return activeNokhteSessionsStream.getActiveNokhteSessionCreationStatus();
  }
}
