import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/confirm_scheduling_time_store.dart';
import '../../../constants/param/confirm_param_entities.dart';
import '../../../constants/return/confirm/confirm_scheduling_time_status_entities.dart';
import '../../../fixtures/p2p_scheduling_sender_mock_gen.mocks.dart';

void main() {
  late MockMConfirmSchedulingTimeGetterStore mockGetterStore;
  late ConfirmSchedulingTimeStore confirmSchedulingTimeStore;
  setUp(() {
    mockGetterStore = MockMConfirmSchedulingTimeGetterStore();
    confirmSchedulingTimeStore = ConfirmSchedulingTimeStore(
      confirmSchedulingTimeGetterStore: mockGetterStore,
    );
  });

  group('stateOrErrorUpdater', () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      confirmSchedulingTimeStore.stateOrErrorUpdater(
          ConstantConfirmSchedulingTimeStatusEntities.wrappedSuccessCase);
      expect(confirmSchedulingTimeStore.isSent, true);
      expect(confirmSchedulingTimeStore.errorMessage, "");
    });

    test("❌ Failure Case: should update accordingly if Failure is passed", () {
      confirmSchedulingTimeStore
          .stateOrErrorUpdater(Left(FailureConstants.dbFailure));
      expect(confirmSchedulingTimeStore.isSent, false);
      expect(confirmSchedulingTimeStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(confirmSchedulingTimeStore.state, StoreState.initial);
    });
  });
  group('call', () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(ConstantConfirmParamEntities.entity)).thenAnswer(
          (_) async =>
              ConstantConfirmSchedulingTimeStatusEntities.wrappedSuccessCase);
      await confirmSchedulingTimeStore(ConstantConfirmParamEntities.entity);

      expect(confirmSchedulingTimeStore.isSent, true);
      expect(confirmSchedulingTimeStore.errorMessage, "");
    });

    test("❌ Failure Case: should update accordingly if Failure is passed",
        () async {
      when(mockGetterStore(ConstantConfirmParamEntities.entity)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await confirmSchedulingTimeStore(ConstantConfirmParamEntities.entity);
      expect(confirmSchedulingTimeStore.isSent, false);
      expect(confirmSchedulingTimeStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(confirmSchedulingTimeStore.state, StoreState.initial);
    });
  });
}
