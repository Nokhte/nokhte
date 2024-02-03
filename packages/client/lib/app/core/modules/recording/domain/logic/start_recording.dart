import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/recording/domain/domain.dart';

class StartRecording implements AbstractFutureNoFailureLogic<bool, String> {
  final RecordingContract contract;

  StartRecording({required this.contract});

  @override
  call(params) async => await contract.startRecording(params);
}
