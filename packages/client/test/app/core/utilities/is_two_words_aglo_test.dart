// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';

void main() {
  test("returns proper boolean with a variety of inputs", () {
    const input1 = "one";
    const input2 = "one two";
    const input3 = "one two three";
    const input4 = "one two three four";
    final output1 = MiscAlgos.isTwoWords(input1);
    final output2 = MiscAlgos.isTwoWords(input2);
    final output3 = MiscAlgos.isTwoWords(input3);
    final output4 = MiscAlgos.isTwoWords(input4);
    expect(output1, false);
    expect(output2, true);
    expect(output3, false);
    expect(output4, false);
  });
}
