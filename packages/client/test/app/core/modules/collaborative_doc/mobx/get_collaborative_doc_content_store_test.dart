import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import '../constants/entities/entities.dart';
import '../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMGetCollaborativeDocContent mockLogic;
  late GetCollaborativeDocContentStore shareSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockLogic = MockMGetCollaborativeDocContent();
    shareSoloDocStore = GetCollaborativeDocContentStore(
      logic: mockLogic,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => ConstantCollaborativeDocContentEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.docContent.listen((value) {
        expect(value.usersContent, "content");
        expect(value.currentUserUID, "lastEditedBy");
        expect(value.lastEditWasTheUser, true);
      });
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.docContent.listen((value) {
        expect(value.usersContent, "");
        expect(value.currentUserUID, "");
        expect(value.lastEditWasTheUser, false);
      });
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
