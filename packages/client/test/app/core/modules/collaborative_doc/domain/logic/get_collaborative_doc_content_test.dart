import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late GetCollaborativeDocContent logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = GetCollaborativeDocContent(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getCollaborativeDocContent()).thenAnswer(
      (_) async => ConstantCollaborativeDocContentEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      entity.docContent.listen((value) {
        expect(value.usersContent, "content");
        expect(value.lastEditWasTheUser, true);
      });
    });

    expect(result,
        const TypeMatcher<Right<Failure, CollaborativeDocContentEntity>>());
    verify(mockContract.getCollaborativeDocContent());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getCollaborativeDocContent()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getCollaborativeDocContent());
    verifyNoMoreInteractions(mockContract);
  });
}
