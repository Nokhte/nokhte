```dart
// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/p2p_scheduling/domain/logic/order_spiral_colors.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/getters/order_spiral_colors_getter_store.dart';

import '../../../constants/date_time.dart';
import '../../../constants/entities.dart';

void main() {
  // now you want to test declare the mock logic
  late OrderSpiralColors orderSpiralLogic;
  late OrderSpiralColorsGetterStore getterStore;

  setUp(() {
    orderSpiralLogic = OrderSpiralColors(
      presentMoment: DateTimeConstants.tPresentMoment,
    );
    getterStore = OrderSpiralColorsGetterStore(
      orderSpiralColors: orderSpiralLogic,
    );
  });

  test("Successfully calls & passes the right entity", () {
    final res = getterStore(NoParams());
    expect(res, ConstantEntities.orderedTimesEntity);
  });
}
```