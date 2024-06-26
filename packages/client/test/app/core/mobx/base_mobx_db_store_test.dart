import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import '../fixtures/dummy_mobx_db_store_child.dart';

void main() {
  late DummyMobxDBStoreChild dummyDBChild;

  setUp(() {
    dummyDBChild = DummyMobxDBStoreChild();
  });

  test("On init sets the variables accordingly", () {
    expect(dummyDBChild.state, StoreState.initial);
    expect(dummyDBChild.errorMessage, "");
  });

  group('mapFailureToMessage', () {
    test("should map the Network Connection error accordingly", () {
      final result = dummyDBChild
          .mapFailureToMessage(FailureConstants.internetConnectionFailure);

      expect(result, FailureConstants.internetConnectionFailureMsg);
    });
    test("should map any other error accordingly", () {
      final result =
          dummyDBChild.mapFailureToMessage(FailureConstants.dbFailure);

      expect(result, FailureConstants.genericFailureMsg);
    });
  });
}
