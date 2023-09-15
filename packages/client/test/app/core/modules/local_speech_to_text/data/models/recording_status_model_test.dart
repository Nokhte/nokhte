import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/types/recording_status.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import '../../constants/models/models.dart';

void main() {
  test('`fromMicrophone` should return entity w/ error if error is given', () {
    final res = RecordingStatusModel.fromMicrophone(RecordingStatus.error);
    expect(res, ConstantRecordingStatusModel.errorCase);
  });
  test('`fromMicrophone` should return entity w/ started if started is given',
      () {
    final res = RecordingStatusModel.fromMicrophone(RecordingStatus.started);
    expect(res, ConstantRecordingStatusModel.startedCase);
  });
  test('`fromMicrophone` should return entity w/ stopped if stopped is given',
      () {
    final res = RecordingStatusModel.fromMicrophone(RecordingStatus.stopped);
    expect(res, ConstantRecordingStatusModel.stoppedCase);
  });
}
