import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PCollaboratorPoolRemoteSource {
  Future<List> validateQuery({required String query});

  Future<FunctionResponse> enterThePool(
      {required CollaboratorPhraseIDs phraseIDs});

  Future<FunctionResponse> exitThePool();

  Stream<bool> getCollaboratorSearchStatus();

  bool cancelStream();
}

class P2PCollaboratorPoolRemoteSourceImpl
    implements P2PCollaboratorPoolRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;
  final ExistingCollaborationsStream existingCollaborationsStream;
  final InitiateCollaboratorSearch initiateCollaboratorSearch;
  final EndCollaboratorSearch endCollaboratorSearch;

  P2PCollaboratorPoolRemoteSourceImpl({
    required this.supabase,
  })  : initiateCollaboratorSearch =
            InitiateCollaboratorSearch(supabase: supabase),
        endCollaboratorSearch = EndCollaboratorSearch(supabase: supabase),
        existingCollaborationsStream =
            ExistingCollaborationsStream(supabase: supabase),
        currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Future<List> validateQuery({required String query}) async {
    final splitQuery = query.split(" ");
    final adjectiveQuery = splitQuery.first;
    final nounQuery = splitQuery[1];
    final adjRes = await PhraseComponentsQueries.checkIfAdjectiveExists(
        supabase: supabase, queryAdjective: adjectiveQuery);
    final nounRes = await PhraseComponentsQueries.checkIfNounExists(
        supabase: supabase, queryNoun: nounQuery);
    return [adjRes, nounRes];
  }

  @override
  enterThePool({required CollaboratorPhraseIDs phraseIDs}) async =>
      await initiateCollaboratorSearch.invoke(
        phraseIDs,
      );

  @override
  Future<FunctionResponse> exitThePool() async =>
      await endCollaboratorSearch.invoke();

  @override
  Stream<bool> getCollaboratorSearchStatus() =>
      existingCollaborationsStream.getCollaboratorSearchStatus();

  @override
  bool cancelStream() {
    existingCollaborationsStream.cancelGetCollaboratorSearchStream();
    return existingCollaborationsStream.collaboratorSearchListeningStatus;
  }
}
