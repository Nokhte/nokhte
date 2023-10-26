// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMInstantiateAgoraSdkGetterStore mockGetterStore;
  late InstantiateAgoraSdkStore instantiateAgoraSdkStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMInstantiateAgoraSdkGetterStore();
    instantiateAgoraSdkStore = InstantiateAgoraSdkStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      instantiateAgoraSdkStore.stateOrErrorUpdater(
        ConstantAgoraSdkStatusEntity.wrappedSuccessCase,
      );
      expect(
        instantiateAgoraSdkStore.isInstantiated,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      instantiateAgoraSdkStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(instantiateAgoraSdkStore.isInstantiated, false);
      expect(instantiateAgoraSdkStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantAgoraSdkStatusEntity.wrappedNotSuccessCase,
      );
      await instantiateAgoraSdkStore(tParams);
      expect(
        instantiateAgoraSdkStore.isInstantiated,
        false,
      );
      expect(instantiateAgoraSdkStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await instantiateAgoraSdkStore(tParams);
      expect(instantiateAgoraSdkStore.isInstantiated, false);
      expect(instantiateAgoraSdkStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
