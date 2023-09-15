// import 'package:leopard_flutter/leopard_transcript.dart';
// import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

// class AudioProcessingModel extends AudioProcessingEntity {
//   const AudioProcessingModel({required super.resultingWords});

//   static AudioProcessingModel fromLeopard(List<LeopardWord> leopardRes) {
//     if (leopardRes.isEmpty) {
//       return const AudioProcessingModel(resultingWords: "");
//     } else {
//       final List<String> words = [];
//       leopardRes.map((value) {
//         return words.add(value.word);
//       });
//       final wordsStr = words.join(' ');
//       return AudioProcessingModel(resultingWords: wordsStr);
//     }
//   }
// }
import 'package:flutter_test/flutter_test.dart';
import 'package:leopard_flutter/leopard_transcript.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import '../../constants/models/models.dart';

void main() {
  test('`fromLeopard` should return entity w/ false if empty array is given',
      () {
    final res = AudioProcessingModel.fromLeopard([]);
    expect(res, ConstantAudioProcessingModel.notSuccessCase);
  });
  test('`fromLeopard` should return entity w/ true if non-empty array is given',
      () {
    final res = AudioProcessingModel.fromLeopard(
      [
        LeopardWord('resulting', 0.0, 0.1, 1.00),
        LeopardWord('words', 0.2, 0.3, 1.00),
      ],
    );
    expect(res, ConstantAudioProcessingModel.successCase);
  });
}
