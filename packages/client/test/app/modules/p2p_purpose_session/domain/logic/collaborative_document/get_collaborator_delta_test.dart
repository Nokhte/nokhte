// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PPurposeSessionCollaborativeDocContract mockContract;
  late GetCollaboratorDelta logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMP2PPurposeSessionCollaborativeDocContract();
    logic = GetCollaboratorDelta(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorDelta()).thenAnswer(
      (_) async => ConstantCollaborativeDocDeltaEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      expect(entity.delta, emits(1));
    });
    expect(
        result,
        const TypeMatcher<
            Right<Failure, CollaborativeDocCollaboratorDeltaEntity>>());
    // expect(result, emits(true));
    verify(mockContract.getCollaboratorDelta());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorDelta()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getCollaboratorDelta());
    verifyNoMoreInteractions(mockContract);
  });
}
