// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';

class MLocalSpeechToTextRemoteSourceImpl extends Mock
    implements LocalSpeechToTextRemoteSourceImpl {}

class MLocalSpeechToTextContract extends Mock
    implements LocalSpeechToTextContract {}

class MInitLeopard extends Mock implements InitLeopard {}

class MStartRecording extends Mock implements StartRecording {}

class MStopRecording extends Mock implements StopRecording {}

class MInitLeopardGetterStore extends Mock implements InitLeopardGetterStore {}

// class MLocalSpeechToTextRemoteSourceImpl extends Mock
//     implements LocalSpeechToTextRemoteSourceImpl {}

class MStartRecordingGetterStore extends Mock
    implements StartRecordingGetterStore {}

class MStopRecordingGetterStore extends Mock
    implements StopRecordingGetterStore {}

@GenerateMocks([
  // MLocalSpeechToTextRemoteSourceImpl,
  MLocalSpeechToTextRemoteSourceImpl,
  MLocalSpeechToTextContract,
  MInitLeopard,
  MStopRecording,
  MStartRecording,
  MInitLeopardGetterStore,
  MStartRecordingGetterStore,
  MStopRecordingGetterStore,
])
@GenerateNiceMocks([
  MockSpec<LocalSpeechToTextRemoteSource>(),
])
void main() {}
