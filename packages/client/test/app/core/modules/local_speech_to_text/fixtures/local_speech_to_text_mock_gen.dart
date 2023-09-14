import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/presentation/presentation.dart';

class MLocalSpeechToTextContract extends Mock
    implements LocalSpeechToTextContract {}

class MInitLeopard extends Mock implements InitLeopard {}

class MProcessAudio extends Mock implements ProcessAudio {}

class MStartRecording extends Mock implements StartRecording {}

class MStopRecording extends Mock implements StopRecording {}

@GenerateMocks([
  MLocalSpeechToTextContract,
  MStopRecording,
  MStartRecording,
  MInitLeopard,
  MProcessAudio,
])
void main() {}
