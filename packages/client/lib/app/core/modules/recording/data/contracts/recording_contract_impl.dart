import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/recording/domain/domain.dart';
import 'package:nokhte/app/core/modules/recording/data/data.dart';

class RecordingContractImpl implements RecordingContract {
  final RecordingRemoteSource remoteSource;

  RecordingContractImpl({required this.remoteSource});

  @override
  startRecording(String path) async => await remoteSource.startRecording(path);

  @override
  stopRecording(NoParams params) async => await remoteSource.stopRecording();
}
