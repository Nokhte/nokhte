// * testing lib
import 'package:flutter_test/flutter_test.dart';
// * mocking lib
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
// * primala core imports
// * mock import
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';
import '../../../../../modules/_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
// * functional programming
import 'package:dartz/dartz.dart';

void main() {
  late CollaborativeDocContractImpl homeContract;
  late MockMCollaborativeDocRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteSource = MockMCollaborativeDocRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    homeContract = CollaborativeDocContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("Method No. 1: getCollaborativeDocContent", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaborativeDocContent())
            .thenAnswer((realInvocation) => Stream.value("content"));
        // act
        final res = await homeContract.getCollaborativeDocContent();
        // assert
        res.fold((failure) {}, (contentEntity) {
          expect(contentEntity.docContent, emits("content"));
        });
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaborativeDocContent())
            .thenAnswer((realInvocation) => Stream.value(""));
        // act
        final res = await homeContract.getCollaborativeDocContent();
        // assert
        res.fold((failure) {}, (contentEntity) {
          expect(contentEntity.docContent, emits(""));
        });
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.getCollaborativeDocContent();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 2: getCollaboratorDelta", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaboratorDelta())
            .thenAnswer((realInvocation) => Stream.value(1));
        // act
        final res = await homeContract.getCollaboratorDelta();
        // assert
        res.fold((failure) {}, (deltaEntity) {
          expect(deltaEntity.delta, emits(1));
        });
        // expect(res, ConstantCollaborativeDocDeltaModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaboratorDelta())
            .thenAnswer((realInvocation) => Stream.value(-1));
        // act
        final res = await homeContract.getCollaboratorDelta();
        // assert
        res.fold((failure) {}, (deltaEntity) {
          expect(deltaEntity.delta, emits(-1));
        });
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.getCollaboratorDelta();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 3: getCollaboratorPresence", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaboratorPresence())
            .thenAnswer((realInvocation) => Stream.value(true));
        // act
        final res = await homeContract.getCollaboratorPresence();
        // assert
        res.fold((failure) {}, (presenceEntity) {
          expect(presenceEntity.isPresent, emits(true));
        });
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaboratorPresence())
            .thenAnswer((realInvocation) => Stream.value(false));
        // act
        final res = await homeContract.getCollaboratorPresence();
        // assert
        res.fold((failure) {}, (presenceEntity) {
          expect(presenceEntity.isPresent, emits(false));
        });
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.getCollaboratorPresence();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 4: createCollaborativeDoc", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      // test("when online and non-empty should return a model", () async {
      //   // arrange
      //   when(mockRemoteSource.shareSoloDoc()).thenAnswer(
      //       (realInvocation) async => SoloDocumentTableResponse.response);
      //   // act
      //   final res = await homeContract.shareSoloDoc();
      //   // assert
      //   expect(res, ConstantSoloDocSharingStatusModel.wrappedSuccessCase);
      // });
      // test("when online and empty should return a model", () async {
      //   // arrange
      //   when(mockRemoteSource.shareSoloDoc())
      //       .thenAnswer((realInvocation) async => []);
      //   // act
      //   final res = await homeContract.shareSoloDoc();
      //   // assert
      //   expect(res, ConstantSoloDocSharingStatusModel.wrappedNotSuccessCase);
      // });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      // test("When offline should return an internet connection error", () async {
      //   final res = await homeContract.shareSoloDoc();
      //   expect(res, Left(FailureConstants.internetConnectionFailure));
      // });
    });
  });
}
