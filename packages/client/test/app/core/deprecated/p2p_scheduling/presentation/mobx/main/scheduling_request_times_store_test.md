```dart
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/p2p_scheduling/utils/time_converter.dart';

import '../../../constants/date_time.dart';
import '../../../constants/entities.dart';

void main() {
  late SchedulingRequestTimesStore schedulingRequestTimesStore;
  late TimeConverter timeConverter;
  setUp(() {
    timeConverter =
        TimeConverter(presentMoment: DateTimeConstants.tPresentMoment);
    schedulingRequestTimesStore = SchedulingRequestTimesStore(
        interactionType: SpiralInteractionType.range,
        timeConverter: timeConverter);
  });
  test(
    "RANGE... updateState acts the way it should & tracks ranges based on the input",
    () {
      // $ panDown on 8:00
      schedulingRequestTimesStore
          .updateState(ConstantEntities.t1stRangeTouchPayload);
      schedulingRequestTimesStore.selectedState.fold((ranges) {
        expect(ranges[0].startTime, ConstantEntities.june19th8AM);
        expect(ranges[0].endTime, '');
        // $ panUpdate at 8:30
        schedulingRequestTimesStore
            .updateState(ConstantEntities.t2ndRangeTouchPayload);
        expect(ranges[0].startTime, ConstantEntities.june19th8AM);
        expect(ranges[0].endTime, ConstantEntities.june19th830AM);
        // $ panDown at 10:00
        schedulingRequestTimesStore
            .updateState(ConstantEntities.t3rdRangeTouchPayload);
        expect(ranges[1].startTime, ConstantEntities.june19th10AM);
        expect(ranges[1].endTime, '');
        // $ panUpdate at 10:30
        schedulingRequestTimesStore
            .updateState(ConstantEntities.t4thRangeTouchPayload);
        expect(ranges[1].startTime, ConstantEntities.june19th10AM);
        expect(ranges[1].endTime, ConstantEntities.june19th1030AM);
        // $ panUpdate at 11:00
        schedulingRequestTimesStore
            .updateState(ConstantEntities.t5thRangeTouchPayload);
        expect(ranges[1].startTime, ConstantEntities.june19th10AM);
        expect(ranges[1].endTime, ConstantEntities.june19th11AM);
      }, (r) => null);
    },
  );
  test(
      "Single...updateState acts the way it should based on single selection payloads",
      () {
    schedulingRequestTimesStore
        .updateState(ConstantEntities.t1stSingleTouchPayload);
    schedulingRequestTimesStore.selectedState.fold((ranges) {}, (single) {
      expect(single, ConstantEntities.june19th8AM);
      // $ panUpdate at 8:30
      schedulingRequestTimesStore
          .updateState(ConstantEntities.t2ndSingeTouchPayload);
      expect(single, ConstantEntities.june19th8AM);
      // $ panDown at 10:00
      schedulingRequestTimesStore
          .updateState(ConstantEntities.t3rdSingleTouchPayload);
      expect(single, ConstantEntities.june19th10AM);
      // $ panUpdate at 10:30
      schedulingRequestTimesStore
          .updateState(ConstantEntities.t4thSingleTouchPayload);
      expect(single, ConstantEntities.june19th10AM);
      // $ panUpdate at 11:00
      schedulingRequestTimesStore
          .updateState(ConstantEntities.t5thSingleTouchPayload);
      expect(single, ConstantEntities.june19th10AM);
    });
  });
}
```
