import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMGetCollaboratorDocInfoGetterStore mockGetterStore;
  late GetCollaboratorDocInfoStore shareSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMGetCollaboratorDocInfoGetterStore();
    shareSoloDocStore = GetCollaboratorDocInfoStore(
      getterStore: mockGetterStore,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async =>
            ConstantCollaborativeDocCollaboratorInfoEntity.wrappedSuccessCase,
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.collaboratorDocinfo.listen((value) {
        expect(value.isPresent, true);
        expect(value.delta, 2);
      });
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(tParams);
      shareSoloDocStore.collaboratorDocinfo.listen((value) {
        expect(value.isPresent, false);
        expect(value.delta, -1);
      });
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
