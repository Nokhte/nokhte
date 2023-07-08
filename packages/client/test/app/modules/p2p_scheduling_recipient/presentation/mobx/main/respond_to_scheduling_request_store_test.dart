import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/main/respond_to_scheduling_request_store.dart';
import '../../../constants/param/respond_param_entity.dart';
import '../../../constants/return/respond/response_status_entities.dart';
import '../../../fixtures/p2p_scheduling_recipient_mock_gen.mocks.dart';

void main() {
  late MockMRespondToSchedulingRequestGetterStore mockGetterStore;
  late RespondToSchedulingRequestStore respondToSchedulingRequestStore;
  setUp(() {
    mockGetterStore = MockMRespondToSchedulingRequestGetterStore();
    respondToSchedulingRequestStore = RespondToSchedulingRequestStore(
      respondToARequestGetterStore: mockGetterStore,
    );
  });

  group('stateOrErrorUpdater', () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      respondToSchedulingRequestStore.stateOrErrorUpdater(
          ConstantResponseStatusEntities.wrappedSuccessCase);
      expect(respondToSchedulingRequestStore.isSent, true);
      expect(respondToSchedulingRequestStore.errorMessage, "");
    });

    test("❌ Failure Case: should update accordingly if Failure is passed", () {
      respondToSchedulingRequestStore
          .stateOrErrorUpdater(Left(FailureConstants.dbFailure));
      expect(respondToSchedulingRequestStore.isSent, false);
      expect(respondToSchedulingRequestStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(respondToSchedulingRequestStore.state, StoreState.initial);
    });
  });
  group('call', () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(ConstantRespondParamEntities.entity)).thenAnswer(
          (_) async => ConstantResponseStatusEntities.wrappedSuccessCase);
      await respondToSchedulingRequestStore(
          ConstantRespondParamEntities.entity);

      expect(respondToSchedulingRequestStore.isSent, true);
      expect(respondToSchedulingRequestStore.errorMessage, "");
    });

    test("❌ Failure Case: should update accordingly if Failure is passed",
        () async {
      when(mockGetterStore(ConstantRespondParamEntities.entity)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await respondToSchedulingRequestStore(
          ConstantRespondParamEntities.entity);
      expect(respondToSchedulingRequestStore.isSent, false);
      expect(respondToSchedulingRequestStore.errorMessage,
          FailureConstants.genericFailureMsg);
      expect(respondToSchedulingRequestStore.state, StoreState.initial);
    });
  });
}
