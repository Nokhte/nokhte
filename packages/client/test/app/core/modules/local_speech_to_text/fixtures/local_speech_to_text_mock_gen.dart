// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';

class MLocalSpeechToTextRemoteSourceImpl extends Mock
    implements LocalSpeechToTextRemoteSourceImpl {}

class MLocalSpeechToTextContract extends Mock
    implements LocalSpeechToTextContract {}

class MInitLeopard extends Mock implements InitLeopard {}

class MProcessAudio extends Mock implements ProcessAudio {}

class MStartRecording extends Mock implements StartRecording {}

class MStopRecording extends Mock implements StopRecording {}

class MInitLeopardGetterStore extends Mock implements InitLeopardGetterStore {}

class MProcessAudioGetterStore extends Mock
    implements ProcessAudioGetterStore {}

class MStartRecordingGetterStore extends Mock
    implements StartRecordingGetterStore {}

class MStopRecordingGetterStore extends Mock
    implements StopRecordingGetterStore {}

@GenerateMocks([
  MLocalSpeechToTextRemoteSourceImpl,
  MLocalSpeechToTextContract,
  MInitLeopard,
  MStopRecording,
  MStartRecording,
  MProcessAudio,
  MInitLeopardGetterStore,
  MStartRecordingGetterStore,
  MStopRecordingGetterStore,
  MProcessAudioGetterStore,
])
void main() {}
