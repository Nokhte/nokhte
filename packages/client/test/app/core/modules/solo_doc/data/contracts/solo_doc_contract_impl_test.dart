// * testing lib
import 'package:flutter_test/flutter_test.dart';
// * mocking lib
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
// * mock import
import '../../../../../modules/_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
// * functional programming
import 'package:dartz/dartz.dart';

import '../../constants/constants.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';
import '../../constants/response/solo_document_table_response.dart';

void main() {
  late SoloDocContractImpl homeContract;
  late MockMSoloDocRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;
  const GetSoloDocParams tParams = GetSoloDocParams(getCollaboratorsDoc: true);
  const CreateSoloDocParams tCreateParams =
      CreateSoloDocParams(docType: 'purpose');

  setUp(() {
    mockRemoteSource = MockMSoloDocRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    homeContract = SoloDocContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("Method No. 1: createSoloDoc", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.createSoloDoc(docType: tCreateParams.docType))
            .thenAnswer(
                (realInvocation) async => SoloDocumentTableResponse.response);
        // act
        final res =
            await homeContract.createSoloDoc(docType: tCreateParams.docType);
        // assert
        expect(res, ConstantSoloDocCreationStatusModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.createSoloDoc(docType: tCreateParams.docType))
            .thenAnswer((realInvocation) async => []);
        // act
        final res =
            await homeContract.createSoloDoc(docType: tCreateParams.docType);
        // assert
        expect(res, ConstantSoloDocCreationStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res =
            await homeContract.createSoloDoc(docType: tCreateParams.docType);
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 2: getSoloDocContent", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getSoloDocContent(
                getCollaboratorsDoc: tParams.getCollaboratorsDoc))
            .thenAnswer(
                (realInvocation) async => SoloDocumentTableResponse.response);
        // act
        final res = await homeContract.getSoloDocContent(
            getCollaboratorsDoc: tParams.getCollaboratorsDoc);
        // assert
        expect(res, ConstantSoloDocContentModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getSoloDocContent(
                getCollaboratorsDoc: tParams.getCollaboratorsDoc))
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await homeContract.getSoloDocContent(
            getCollaboratorsDoc: tParams.getCollaboratorsDoc);
        // assert
        expect(res, ConstantSoloDocContentModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.getSoloDocContent(
          getCollaboratorsDoc: tParams.getCollaboratorsDoc,
        );
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 3: sealSoloDoc", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.sealSoloDoc()).thenAnswer(
            (realInvocation) async => SoloDocumentTableResponse.response);
        // act
        final res = await homeContract.sealSoloDoc();
        // assert
        expect(res, ConstantSoloDocSealingStatusModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.sealSoloDoc())
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await homeContract.sealSoloDoc();
        // assert
        expect(res, ConstantSoloDocSealingStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.sealSoloDoc();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 4: shareSoloDoc", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.shareSoloDoc()).thenAnswer(
            (realInvocation) async => SoloDocumentTableResponse.response);
        // act
        final res = await homeContract.shareSoloDoc();
        // assert
        expect(res, ConstantSoloDocSharingStatusModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.shareSoloDoc())
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await homeContract.shareSoloDoc();
        // assert
        expect(res, ConstantSoloDocSharingStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.shareSoloDoc();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 5: submitDocContent", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.submitDocContent(newContent: "content"))
            .thenAnswer(
                (realInvocation) async => SoloDocumentTableResponse.response);
        // act
        final res = await homeContract.submitDocContent(newContent: "content");
        // assert
        expect(res, ConstantSoloDocSubmissionStatusModel.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.submitDocContent(newContent: "content"))
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await homeContract.submitDocContent(newContent: "content");
        // assert
        expect(res, ConstantSoloDocSubmissionStatusModel.wrappedNotSuccessCase);
      });
    });
  });
  group("is not Online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test("When offline should return an internet connection error", () async {
      final res = await homeContract.submitDocContent(newContent: "content");
      expect(res, Left(FailureConstants.internetConnectionFailure));
    });
  });
}
