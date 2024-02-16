import 'dart:io';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/recording/domain/domain.dart';

class StopRecording implements AbstractFutureNoFailureLogic<File, NoParams> {
  final RecordingContract contract;

  StopRecording({required this.contract});

  @override
  call(params) async => await contract.stopRecording(params);
}
