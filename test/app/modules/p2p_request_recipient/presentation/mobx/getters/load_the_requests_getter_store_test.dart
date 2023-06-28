import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/getters/load_the_requests_getter_store.dart';
import '../../../constants/entities.dart';
import '../../../fixtures/p2p_request_recipient_stack_mock_gen.mocks.dart';

void main() {
  // get the mock logic
  late MockMLoadTheRequests mockLogic;
  late LoadTheRequestsGetterStore getterStore;

  late Either<Failure, P2PRecipientRequestPresentationalEntity>
      tEitherEntityOrFailure;

  setUp(() {
    mockLogic = MockMLoadTheRequests();
    getterStore = LoadTheRequestsGetterStore(loadLogic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherEntityOrFailure =
          Right(ConstantEntities.formattedSuccessfulP2PRecipientRequestEntity);
    });
    test("should pass the entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((_) async => tEitherEntityOrFailure);
      final res = await getterStore();
      expect(res, tEitherEntityOrFailure);
    });
  });
  group("❌ Failure Cases", () {
    setUp(() {
      tEitherEntityOrFailure = Left(FailureConstants.dbFailure);
    });
    test("should pass the entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((_) async => tEitherEntityOrFailure);
      final res = await getterStore();
      expect(res, tEitherEntityOrFailure);
    });
  });
}
