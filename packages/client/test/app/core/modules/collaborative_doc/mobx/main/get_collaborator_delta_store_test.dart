// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMGetCollaboratorDeltaGetterStore mockGetterStore;
  late GetCollaboratorDeltaStore shareSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMGetCollaboratorDeltaGetterStore();
    shareSoloDocStore = GetCollaboratorDeltaStore(
      getterStore: mockGetterStore,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantCollaborativeDocDeltaEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore(tParams);
      expect(
        shareSoloDocStore.collaboratorDelta,
        emits(1),
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(tParams);
      expect(shareSoloDocStore.collaboratorDelta, emits(-1));
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
