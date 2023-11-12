import 'package:nokhte_backend/phrase_components.dart';
import 'package:nokhte_backend/edge_functions.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
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

  P2PCollaboratorPoolRemoteSourceImpl({
    required this.supabase,
    required this.existingCollaborationsStream,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

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
  enterThePool({required CollaboratorPhraseIDs phraseIDs}) async {
    return await InitiateCollaboratorSearch.invoke(
      supabase: supabase,
      wayfarerUID: currentUserUID,
      queryPhraseIDs: phraseIDs,
    );
  }

  @override
  Future<FunctionResponse> exitThePool() async {
    return await EndCollaboratorSearch.invoke(
      supabase: supabase,
      firstUserUID: currentUserUID,
    );
  }

  @override
  Stream<bool> getCollaboratorSearchStatus() {
    return existingCollaborationsStream.notifyWhenForged(
      supabase: supabase,
      userUID: currentUserUID,
    );
  }

  @override
  bool cancelStream() {
    existingCollaborationsStream.cancelStream();

    return existingCollaborationsStream.isListening;
  }
}
