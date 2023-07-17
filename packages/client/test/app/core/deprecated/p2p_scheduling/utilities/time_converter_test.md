```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/p2p_scheduling/utils/time_converter.dart';

import '../constants/date_time.dart';
import '../constants/entities.dart';

void main() {
  late TimeConverter timeConverter;
  setUp(() {
    timeConverter = TimeConverter(
      presentMoment: DateTimeConstants.tPresentMoment,
    );
  });

  test("should convert single digit times accordingly", () {
    final res1 = timeConverter.hrToTimestampz('08:00');
    expect(res1, ConstantEntities.june19th8AM);
    final res2 = timeConverter.hrToTimestampz('08:30');
    expect(res2, ConstantEntities.june19th830AM);
  });
  test("should convert double digit times accordingly", () {
    final res1 = timeConverter.hrToTimestampz('10:00');
    expect(res1, ConstantEntities.june19th10AM);
    final res2 = timeConverter.hrToTimestampz('10:30');
    expect(res2, ConstantEntities.june19th1030AM);
  });
}
```