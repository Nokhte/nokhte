import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/p2p_scheduling/domain/logic/order_spiral_colors.dart';
import '../constants/date_time.dart';
import '../constants/entities.dart';

void main() {
  late OrderSpiralColors orderSpiralLogic;

  setUp(() {
    orderSpiralLogic = OrderSpiralColors(
      presentMoment: DateTimeConstants.tPresentMoment,
    );
  });

  /// @ dev: since this is a synchronous no failure function no failure case
  /// @ will be needed
  test("✅ should pass the entity with the times in the proper order", () {
    final res = orderSpiralLogic(NoParams());
    expect(res, ConstantEntities.orderedTimesEntity);
  });
}
