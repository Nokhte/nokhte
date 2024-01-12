import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMGetCollaboratorSearchStatus mockLogic;
  late GetCollaboratorSearchStatusStore shareSoloDocStore;

  setUp(() {
    mockLogic = MockMGetCollaboratorSearchStatus();
    shareSoloDocStore = GetCollaboratorSearchStatusStore(
      logic: mockLogic,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => ConstantCollaboratorSearchStatusEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore();
      expect(
        shareSoloDocStore.searchStatus,
        emits(
            CollaboratorSearchAndEntryStatus(hasFoundTheirCollaborator: true)),
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore();
      expect(shareSoloDocStore.searchStatus,
          neverEmits(shareSoloDocStore.searchStatus));
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
