import 'package:primala/app/core/modules/local_speech_to_text/data/contracts/local_speech_to_text_contract_impl.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';

class LocalSpeechToTextModule extends Module {
  @override
  List<Bind> get binds => [
        // & Callback Store
        Bind.singleton<OnAudioRecordedStore>(
          (i) => OnAudioRecordedStore(),
        ),
        // & Callback Logic
        Bind.singleton<OnAudioRecorded>(
          (i) => OnAudioRecorded(
            onAudioRecordedStore: i<OnAudioRecordedStore>(),
          ),
        ),
// & Data Source
        Bind.singleton<LocalSpeechToTextRemoteSourceImpl>(
          (i) => LocalSpeechToTextRemoteSourceImpl(
            onAudioRecorded: i<OnAudioRecorded>(),
          ),
        ),
// & Contract Implementation
        Bind.singleton<LocalSpeechToTextContractImpl>(
          (i) => LocalSpeechToTextContractImpl(
            remoteSource: i<LocalSpeechToTextRemoteSourceImpl>(),
            networkInfo: i<NetworkInfo>(),
          ),
        ),
// & Logic
        Bind.singleton<InitLeopard>(
          (i) => InitLeopard(
            contract: i<LocalSpeechToTextContract>(),
          ),
        ),
        Bind.singleton<ProcessAudio>(
          (i) => ProcessAudio(
            contract: i<LocalSpeechToTextContract>(),
          ),
        ),
        Bind.singleton<StartRecording>(
          (i) => StartRecording(
            contract: i<LocalSpeechToTextContract>(),
          ),
        ),
        Bind.singleton<StopRecording>(
          (i) => StopRecording(
            contract: i<LocalSpeechToTextContract>(),
          ),
        ),
// & MobX Getter Stores
        Bind.singleton<InitLeopardGetterStore>(
          (i) => InitLeopardGetterStore(
            logic: i<InitLeopard>(),
          ),
        ),

        Bind.singleton<ProcessAudioGetterStore>(
          (i) => ProcessAudioGetterStore(
            logic: i<ProcessAudio>(),
          ),
        ),
        Bind.singleton<StopRecordingGetterStore>(
          (i) => StopRecordingGetterStore(
            logic: i<StopRecording>(),
          ),
        ),
        Bind.singleton<StartRecordingGetterStore>(
          (i) => StartRecordingGetterStore(
            logic: i<StartRecording>(),
          ),
        ),
// & Mobx Mother Stores
        Bind.singleton<InitLeopardStore>(
          (i) => InitLeopardStore(
            getterStore: i<InitLeopardGetterStore>(),
          ),
        ),

        Bind.singleton<ProcessAudioStore>(
          (i) => ProcessAudioStore(
            getterStore: i<ProcessAudioGetterStore>(),
          ),
        ),
        Bind.singleton<StopRecordingStore>(
          (i) => StopRecordingStore(
            getterStore: i<StopRecordingGetterStore>(),
          ),
        ),
        Bind.singleton<StartRecordingStore>(
          (i) => StartRecordingStore(
            getterStore: i<StartRecordingGetterStore>(),
          ),
        ),
        // & Coordinator
        Bind.singleton<LocalSpeechToTextCoordinatorStore>(
          (i) => LocalSpeechToTextCoordinatorStore(
            initLeopardStore: i<InitLeopardStore>(),
            processAudioStore: i<ProcessAudioStore>(),
            stopRecordingStore: i<StopRecordingStore>(),
            startRecordingStore: i<StartRecordingStore>(),
          ),
        ),
      ];
}
