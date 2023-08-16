```dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/getters/respond_to_scheduling_request_getter_store.dart';
import '../../../constants/param/respond_param_entity.txt';
import '../../../constants/return/respond/response_status_entities.txt';
import '../../../fixtures/p2p_scheduling_recipient_mock_gen.mocks.txt';

void main() {
  late MockMRespondToSchedulingRequest mockLogic;
  late RespondToSchedulingRequestGetterStore getterStore;

  late Either<Failure, P2PSchedulingResponseStatusEntity>
      tEitherStatusOrFailure;

  setUp(() {
    mockLogic = MockMRespondToSchedulingRequest();
    getterStore = RespondToSchedulingRequestGetterStore(
      respondToSchedulingRequestLogic: mockLogic,
    );
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantResponseStatusEntities.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(ConstantRespondParamEntities.entity)).thenAnswer(
        (_) async => tEitherStatusOrFailure,
      );
      final res = await getterStore(ConstantRespondParamEntities.entity);
      expect(res, tEitherStatusOrFailure);
    });
  });
  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test('should pass a failure correctly', () async {
      when(mockLogic(ConstantRespondParamEntities.entity)).thenAnswer(
        (_) async => tEitherStatusOrFailure,
      );
      final res = await getterStore(ConstantRespondParamEntities.entity);
      expect(res, tEitherStatusOrFailure);
    });
  });
}
```
