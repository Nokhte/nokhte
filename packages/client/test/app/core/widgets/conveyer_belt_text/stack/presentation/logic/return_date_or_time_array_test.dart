import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/logic/return_date_or_time_array.dart';
import 'package:primala/app/core/widgets/widgets.dart';

void main() {
  late ReturnDateOrTimeArray logic;

  setUp(() {
    logic = ReturnDateOrTimeArray();
  });

  test("should return a proper date array", () {
    final now = DateTime.now();
    final tList = logic(ReturnDateOrTimeArrayParams(
      currentTime: now,
      dateOrTime: DateOrTime.date,
    ));
    expect(tList[0].unformatted, now);
    expect(tList[3].unformatted, now.add(const Duration(days: 3)));
  });
  test("should return a proper time array", () {
    final now = DateTime.now();
    int currentHour = now.hour;
    final tList = logic(ReturnDateOrTimeArrayParams(
      currentTime: now,
      dateOrTime: DateOrTime.time,
    ));
    for (int i = 0; i < tList.length; i++) {
      if (currentHour == tList[i].unformatted.hour) {
        expect(tList[i].isTheActiveOne, true);
      }
    }
  });
}
