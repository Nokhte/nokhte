// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PPurposeSessionCollaborativeDocContract mockContract;
  late GetCollaboratorPresence logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMP2PPurposeSessionCollaborativeDocContract();
    logic = GetCollaboratorPresence(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorPresence()).thenAnswer(
      (_) async =>
          ConstantCollaborativeDocCollaboratorPresenceEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      expect(entity.isPresent, emits(true));
    });
    expect(
        result,
        const TypeMatcher<
            Right<Failure, CollaborativeDocCollaboratorPresenceEntity>>());
    // expect(result, emits(true));
    verify(mockContract.getCollaboratorPresence());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorPresence()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getCollaboratorPresence());
    verifyNoMoreInteractions(mockContract);
  });
}
