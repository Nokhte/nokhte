import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

void main() {
  late AvailabilitySectorsStore testStore;

  setUp(() => testStore = AvailabilitySectorsStore());

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(3));
    });
  });
}
