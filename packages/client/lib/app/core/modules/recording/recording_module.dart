import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/recording/data/data.dart';
import 'package:nokhte/app/core/modules/recording/domain/domain.dart';
import 'package:nokhte/app/core/modules/recording/mobx/coordinators/recording_coordinator.dart';
import 'package:record/record.dart';

class RecordingModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<RecordingRemoteSourceImpl>(
      () => RecordingRemoteSourceImpl(
        recorder: AudioRecorder(),
      ),
    );
    i.add<RecordingContractImpl>(
      () => RecordingContractImpl(
        remoteSource: i<RecordingRemoteSourceImpl>(),
      ),
    );
    i.add<StartRecording>(
      () => StartRecording(
        contract: i<RecordingContractImpl>(),
      ),
    );
    i.add<StopRecording>(
      () => StopRecording(
        contract: i<RecordingContractImpl>(),
      ),
    );
    i.add<RecordingCoordinator>(
      () => RecordingCoordinator(
        startRecordingLogic: i<StartRecording>(),
        stopRecordingLogic: i<StopRecording>(),
      ),
    );
  }
}
