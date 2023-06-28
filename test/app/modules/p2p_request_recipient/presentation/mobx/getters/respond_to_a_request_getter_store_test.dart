import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/getters/respond_to_a_request_getter_store.dart';

import '../../../fixtures/p2p_request_recipient_stack_mock_gen.mocks.dart';

void main() {
  // get the mock logic
  late MockMRespondToARequest mockLogic;
  late RespondToARequestGetterStore getterStore;
  late Either<Failure, P2PRequestRecipientResponseStatusEntity>
      tEitherEntityOrFailure;

  setUp(() {
    mockLogic = MockMRespondToARequest();
    getterStore = RespondToARequestGetterStore(respondLogic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherEntityOrFailure = const Right(
        P2PRequestRecipientResponseStatusEntity(
          isSent: true,
        ),
      );
    });
    test("should pass the entity w/ the right state", () async {
      when(mockLogic(const P2PRespondToReqParams(senderUsername: 'test1')))
          .thenAnswer((_) async => tEitherEntityOrFailure);
      final res = await getterStore('test1');
      expect(res, tEitherEntityOrFailure);
    });
  });
  group("❌ Failure Cases", () {
    setUp(() {
      tEitherEntityOrFailure = Left(FailureConstants.dbFailure);
    });
    test("should pass the entity w/ the right state", () async {
      when(mockLogic(const P2PRespondToReqParams(senderUsername: 'test1')))
          .thenAnswer((_) async => tEitherEntityOrFailure);
      final res = await getterStore('test1');
      expect(res, tEitherEntityOrFailure);
    });
  });
}
