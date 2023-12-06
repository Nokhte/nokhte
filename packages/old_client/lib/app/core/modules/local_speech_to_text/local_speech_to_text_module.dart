import 'package:nokhte/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class LocalSpeechToTextModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OnSpeechResultStore>(
          (i) => OnSpeechResultStore(),
          export: true,
        ),
        Bind.singleton<OnAudioRecordedStore>(
          (i) => OnAudioRecordedStore(),
          export: true,
        ),
        Bind.singleton<OnSpeechResult>(
          (i) => OnSpeechResult(
            speechResultStore: i<OnSpeechResultStore>(),
          ),
          export: true,
        ),
        Bind.singleton<OnAudioRecorded>(
          (i) => OnAudioRecorded(
            onAudioRecordedStore: i<OnAudioRecordedStore>(),
          ),
          export: true,
        ),
        Bind.singleton<LocalSpeechToTextRemoteSourceImpl>(
          (i) => LocalSpeechToTextRemoteSourceImpl(
            onAudioRecorded: i<OnAudioRecorded>(),
          ),
          export: true,
        ),
        Bind.singleton<LocalSpeechToTextContractImpl>(
          (i) => LocalSpeechToTextContractImpl(
            remoteSource: i<LocalSpeechToTextRemoteSourceImpl>(),
            networkInfo: i<NetworkInfo>(),
          ),
          export: true,
        ),
        Bind.singleton<InitLeopard>(
          (i) => InitLeopard(
            contract: i<LocalSpeechToTextContract>(),
          ),
          export: true,
        ),
        Bind.singleton<StartRecording>(
          (i) => StartRecording(
            contract: i<LocalSpeechToTextContract>(),
          ),
          export: true,
        ),
        Bind.singleton<StopRecording>(
          (i) => StopRecording(
            contract: i<LocalSpeechToTextContract>(),
          ),
          export: true,
        ),
        Bind.singleton<InitLeopardStore>(
          (i) => InitLeopardStore(
            logic: i<InitLeopard>(),
          ),
          export: true,
        ),
        Bind.singleton<StopRecordingStore>(
          (i) => StopRecordingStore(
            logic: i<StopRecording>(),
          ),
          export: true,
        ),
        Bind.singleton<StartRecordingStore>(
          (i) => StartRecordingStore(
            logic: i<StartRecording>(),
          ),
          export: true,
        ),
        Bind.singleton<LocalSpeechToTextCoordinator>(
          (i) => LocalSpeechToTextCoordinator(
            onSpeechResultStore: i<OnSpeechResultStore>(),
            initLeopardStore: i<InitLeopardStore>(),
            stopRecordingStore: i<StopRecordingStore>(),
            startRecordingStore: i<StartRecordingStore>(),
          ),
          export: true,
        ),
      ];
}
