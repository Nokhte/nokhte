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
  late MockMGetCollaborativeDocContentGetterStore mockGetterStore;
  late GetCollaborativeDocContentStore shareSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMGetCollaborativeDocContentGetterStore();
    shareSoloDocStore = GetCollaborativeDocContentStore(
      getterStore: mockGetterStore,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantCollaborativeDocContentEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.docContent.listen((value) {
        expect(value.content, "content");
        expect(value.currentUserUID, "lastEditedBy");
        expect(value.lastEditedBy, "lastEditedBy");
      });
      // expect(
      //   shareSoloDocStore.docContent,
      //   emits("content"),
      // );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.docContent.listen((value) {
        expect(value.content, "");
        expect(value.currentUserUID, "");
        expect(value.lastEditedBy, "");
      });
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
