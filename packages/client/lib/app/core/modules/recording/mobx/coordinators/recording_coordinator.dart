// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/recording/domain/logic/logic.dart';
part 'recording_coordinator.g.dart';

class RecordingCoordinator = _RecordingCoordinatorBase
    with _$RecordingCoordinator;

abstract class _RecordingCoordinatorBase extends BaseMobxDBStore with Store {
  final StartRecording startRecordingLogic;
  final StopRecording stopRecordingLogic;

  _RecordingCoordinatorBase({
    required this.startRecordingLogic,
    required this.stopRecordingLogic,
  });

  @observable
  File recording = File('');

  @observable
  bool isRecording = false;

  @action
  startRecording(String path) async {
    final res = await startRecordingLogic(path);
    isRecording = res;
  }

  @action
  stopRecording(NoParams params) async {
    final res = await stopRecordingLogic(params);
    recording = res;
    isRecording = false;
  }
}
