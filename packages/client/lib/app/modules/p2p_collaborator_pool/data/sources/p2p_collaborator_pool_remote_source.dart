import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:primala_backend/phrase_components.dart';
import 'package:primala_backend/edge_functions.dart';
import 'package:primala_backend/streams.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PCollaboratorPoolRemoteSource {
  Future<bool> initiateSpeechToText();

  Future startListening();

  Future stopListening();

  Future<List> validateQuery({required String query});

  Future<FunctionResponse> enterThePool(
      {required CollaboratorPhraseIDs phraseIDs});

  Future<FunctionResponse> exitThePool();

  Stream<bool> listenToCollaboratorMatchStatus();

  bool cancelCollaboratorMatchStatusStream();
}

class P2PCollaboratorPoolRemoteSourceImpl
    implements P2PCollaboratorPoolRemoteSource {
  final SpeechToText speechToText;
  final SupabaseClient supabase;
  final OnSpeechResult onSpeechResult;
  final String currentUserUID;
  final ExistingCollaborationsStream existingCollaborationsStream;

  P2PCollaboratorPoolRemoteSourceImpl({
    required this.speechToText,
    required this.supabase,
    required this.onSpeechResult,
    required this.existingCollaborationsStream,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Future<bool> initiateSpeechToText() async {
    return await speechToText.initialize();
  }

  @override
  Future startListening() async {
    await speechToText.listen(
      onResult: (result) {
        onSpeechResult(result);
      },
    );
    return true;
  }

  @override
  Future stopListening() async {
    await speechToText.stop();
    return true;
  }

  @override
  Future<List> validateQuery({required String query}) async {
    final splitQuery = query.split(" ");
    final adjectiveQuery = splitQuery[0];
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
  Stream<bool> listenToCollaboratorMatchStatus() {
    return existingCollaborationsStream.notifyWhenForged(
      supabase: supabase,
      userUID: currentUserUID,
    );
  }

  @override
  bool cancelCollaboratorMatchStatusStream() {
    existingCollaborationsStream.cancelStream();

    return existingCollaborationsStream.isListening;
  }
}
