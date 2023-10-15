import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/logic/return_date_or_time_array.dart';
import 'package:primala/app/core/widgets/widgets.dart';

void main() {
  late ConveyerBeltTextStore store;
  late ReturnDateOrTimeArray logic;

  setUp(() {
    logic = ReturnDateOrTimeArray();
    store = ConveyerBeltTextStore(
      logic: logic,
      dateOrTimeParam: DateOrTime.date,
    );
  });

  test("computed properties should act properly ", () {
    expect(store.leftMostValue.isEmpty, true);
    expect(store.leftValue.isEmpty, true);
    expect(store.centerValue.isNotEmpty, true);
    expect(store.rightValue.isNotEmpty, true);
    expect(store.rightMostValue.isNotEmpty, true);
    store.setCurrentlySelectedIndex(1);
    expect(store.leftMostValue.isEmpty, true);
    expect(store.leftValue.isEmpty, false);
    expect(store.centerValue.isNotEmpty, true);
    expect(store.rightValue.isNotEmpty, true);
    expect(store.rightMostValue.isNotEmpty, true);
    store.setCurrentlySelectedIndex(3);
    expect(store.leftMostValue.isEmpty, false);
    expect(store.leftValue.isEmpty, false);
    expect(store.centerValue.isNotEmpty, true);
    expect(store.rightValue.isNotEmpty, false);
    expect(store.rightMostValue.isNotEmpty, false);
  });
}
