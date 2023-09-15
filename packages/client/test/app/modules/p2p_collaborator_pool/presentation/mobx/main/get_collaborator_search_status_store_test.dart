// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMGetCollaboratorSearchStatusGetterStore mockGetterStore;
  late GetCollaboratorSearchStatusStore shareSoloDocStore;

  setUp(() {
    mockGetterStore = MockMGetCollaboratorSearchStatusGetterStore();
    shareSoloDocStore = GetCollaboratorSearchStatusStore(
      collaboratorSearchStatusGetter: mockGetterStore,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantCollaboratorSearchStatusEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore();
      expect(
        shareSoloDocStore.searchStatus,
        emits(true),
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore();
      expect(shareSoloDocStore.searchStatus, emits(false));
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
