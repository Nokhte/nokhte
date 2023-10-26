// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late GetCollaboratorDocInfo logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = GetCollaboratorDocInfo(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorDocInfo()).thenAnswer(
      (_) async =>
          ConstantCollaborativeDocCollaboratorInfoEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      entity.collaboratorDocInfo.listen((event) {
        expect(event.delta, 2);
        expect(event.isPresent, true);
      });
    });
    verify(mockContract.getCollaboratorDocInfo());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorDocInfo()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getCollaboratorDocInfo());
    verifyNoMoreInteractions(mockContract);
  });
}
