import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/widgets.dart';

void main() {
  late ReturnDateOrTimeArray logic;
  late ReturnDateOrTimeEntity tEntity;

  setUp(() {
    logic = ReturnDateOrTimeArray();
  });

  test("should return a proper date array", () {
    final now = DateTime.now();
    tEntity = logic(ReturnDateOrTimeArrayParams(
      currentTime: now,
      dateOrTime: DateOrTime.date,
    ));
    final tList = tEntity.dateOrTimeList;
    expect(tList[2].unformatted, now);
    expect(tList[5].unformatted, now.add(const Duration(days: 3)));
    expect(tEntity.activeSelectionIndex, 1);
  });
  test("should return a proper time array", () {
    final now = DateTime.now();
    int currentHour = now.hour;
    int oneHourInTheFuture = ((currentHour + 1) % 24).floor();
    tEntity = logic(ReturnDateOrTimeArrayParams(
      currentTime: now,
      dateOrTime: DateOrTime.time,
    ));
    final tList = tEntity.dateOrTimeList;
    expect(tList[currentHour].isTheActiveOne, true);
    expect(tList[oneHourInTheFuture].isTheActiveOne, false);
  });
}
