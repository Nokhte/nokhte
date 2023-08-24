// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/on_speech_result_store.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MP2PCollaboratorPoolContract extends Mock
    implements P2PCollaboratorPoolContract {}

class MInitiateSpeechToText extends Mock implements InitiateSpeechToText {}

class MOnSpeechResult extends Mock implements OnSpeechResult {}

class MEnterCollaboratorPool extends Mock implements EnterCollaboratorPool {}

class MStartListening extends Mock implements StartListening {}

class MStopListening extends Mock implements StopListening {}

class MValidateQuery extends Mock implements ValidateQuery {}

class MOnSpeechResultStore extends Mock implements OnSpeechResultStore {}

class MSpeechToText extends Mock implements SpeechToText {}

@GenerateMocks([
  MEnterCollaboratorPool,
  MSpeechToText,
  MInitiateSpeechToText,
  MOnSpeechResult,
  MStartListening,
  MStopListening,
  MValidateQuery,
  MP2PCollaboratorPoolContract,
  MOnSpeechResultStore,
])
@GenerateNiceMocks([
  MockSpec<P2PCollaboratorPoolRemoteSource>(),
])
void main() {}
