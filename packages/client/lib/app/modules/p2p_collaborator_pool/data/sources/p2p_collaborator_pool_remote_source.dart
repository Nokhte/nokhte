import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:primala_backend/phrase_components.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PCollaboratorPoolRemoteSource {
  Future<bool> initiateSpeechToText();

  Future startListening();

  Future stopListening();

  Future<List> validateQuery({required String query});
}

class P2PCollaboratorPoolRemoteSourceImpl
    implements P2PCollaboratorPoolRemoteSource {
  final SpeechToText speechToText;
  final SupabaseClient supabase;
  final OnSpeechResult onSpeechResult;

  P2PCollaboratorPoolRemoteSourceImpl({
    required this.speechToText,
    required this.supabase,
    required this.onSpeechResult,
  });

  @override
  Future<bool> initiateSpeechToText() async {
    return await speechToText.initialize();
  }

  @override
  Future startListening() async {
    await speechToText.listen(
      onResult: (result) => onSpeechResult(result),
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
    print("The split query ${splitQuery[0]} ${splitQuery[1]} 4rm The Source");
    final adjRes = await PhraseComponentsQueries.checkIfAdjectiveExists(
        supabase: supabase, queryAdjective: adjectiveQuery);
    final nounRes = await PhraseComponentsQueries.checkIfNounExists(
        supabase: supabase, queryNoun: nounQuery);
    return [adjRes, nounRes];
  }
}
