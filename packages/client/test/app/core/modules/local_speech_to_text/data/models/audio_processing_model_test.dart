import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/data/data.dart';
import '../../constants/constants.dart';

void main() {
  test('`fromLeopard` should return entity w/ false if empty array is given',
      () {
    final res = AudioProcessingModel.fromLeopard([]);
    expect(res, ConstantAudioProcessingModel.notSuccessCase);
  });
  test('`fromLeopard` should return entity w/ true if non-empty array is given',
      () {
    final res = AudioProcessingModel.fromLeopard(Leopard.response);
    expect(res, ConstantAudioProcessingModel.successCase);
  });
}
