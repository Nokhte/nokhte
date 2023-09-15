import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart';
import '../../constants/responses/responses.dart';
import '../../constants/models/models.dart';
import '../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late P2PCollaboratorPoolContractImpl p2pCollaboratorPoolContract;
  late MockMP2PCollaboratorPoolRemoteSourceImpl mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockMNetworkInfo();
    mockRemoteSource = MockMP2PCollaboratorPoolRemoteSourceImpl();
    p2pCollaboratorPoolContract = P2PCollaboratorPoolContractImpl(
        remoteSource: mockRemoteSource, networkInfo: mockNetworkInfo);
  });

  group("Method No. 1: initializeSpeechToText", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online and approved should return a proper model", () async {
        // arrange
        when(mockRemoteSource.initiateSpeechToText())
            .thenAnswer((realInvocation) async => Future.value(true));
        // act
        final res = await p2pCollaboratorPoolContract.initializeSpeechToText();
        // assert
        expect(
            res, ConstantSpeechToTextInitializerStatusModel.wrappedSuccessCase);
      });
      test("when online and not approved should return a proper model",
          () async {
        // arrange
        when(mockRemoteSource.initiateSpeechToText())
            .thenAnswer((realInvocation) async => false);
        // act
        final res = await p2pCollaboratorPoolContract.initializeSpeechToText();
        // assert
        expect(res,
            ConstantSpeechToTextInitializerStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract.initializeSpeechToText();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 2: startListening", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online and no errors are shown should return a proper model",
          () async {
        // arrange
        when(mockRemoteSource.startListening())
            .thenAnswer((realInvocation) async => true);
        // act
        final res = await p2pCollaboratorPoolContract.startListening();
        // assert
        expect(res, ConstantListeningStatusModel.wrappedSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract.startListening();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 3: stopListening", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      test("when online and no errors are shown should return a proper model",
          () async {
        // arrange
        when(mockRemoteSource.stopListening())
            .thenAnswer((realInvocation) async => true);
        // act
        final res = await p2pCollaboratorPoolContract.stopListening();
        // assert
        expect(res, ConstantListeningStatusModel.wrappedSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract.stopListening();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 4: validateQuery", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online and non-empty should return a false model", () async {
        // arrange
        when(mockRemoteSource.validateQuery(query: "some phrase"))
            .thenAnswer((realInvocation) async => [
                  [
                    {"id": 1}
                  ],
                  [
                    {"id": 1}
                  ]
                ]);
        // act
        final res =
            await p2pCollaboratorPoolContract.validateQuery("some phrase");
        // assert
        expect(
            res, ConstantCollaboratorPhraseValidationModel.wrappedSuccessCase);
      });
      test("when online and empty should return a true model", () async {
        when(mockRemoteSource.validateQuery(query: "some phrase"))
            .thenAnswer((realInvocation) async => [[], []]);
        // act
        final res =
            await p2pCollaboratorPoolContract.validateQuery("some phrase");
        // assert
        expect(res,
            ConstantCollaboratorPhraseValidationModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract
            .validateQuery('something something');
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 5: EnterTheCollaboratorPool", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online w/ a  200 should return a successful model", () async {
        // arrange
        when(mockRemoteSource.enterThePool(phraseIDs: PhraseIDs.phraseID))
            .thenAnswer((realInvocation) async => FunctionResponses.successRes);
        // act
        final res = await p2pCollaboratorPoolContract.enterTheCollaboratorPool(
            phraseIDs: PhraseIDs.phraseID);
        // assert
        expect(
            res, ConstantCollaboratorPoolEntryStatusModel.wrappedSuccessCase);
      });
      test("when online w/ a non 200  should return a not successful model",
          () async {
        when(mockRemoteSource.enterThePool(phraseIDs: PhraseIDs.phraseID))
            .thenAnswer(
                (realInvocation) async => FunctionResponses.notSuccessRes);
        // act
        final res = await p2pCollaboratorPoolContract.enterTheCollaboratorPool(
            phraseIDs: PhraseIDs.phraseID);
        // assert
        expect(res,
            ConstantCollaboratorPoolEntryStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract.enterTheCollaboratorPool(
            phraseIDs: PhraseIDs.phraseID);
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 6: ExitTheCollaboratorPool", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online w/ a  200 should return a successful model", () async {
        // arrange
        when(mockRemoteSource.exitThePool())
            .thenAnswer((realInvocation) async => FunctionResponses.successRes);
        // act
        final res = await p2pCollaboratorPoolContract.exitCollaboratorPool();
        // assert
        expect(res, ConstantCollaboratorPoolExitStatusModel.wrappedSuccessCase);
      });
      test("when online w/ a non 200  should return a not successful model",
          () async {
        when(mockRemoteSource.exitThePool()).thenAnswer(
            (realInvocation) async => FunctionResponses.notSuccessRes);
        // act
        final res = await p2pCollaboratorPoolContract.exitCollaboratorPool();
        // assert
        expect(
            res, ConstantCollaboratorPoolExitStatusModel.wrappedNotSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res = await p2pCollaboratorPoolContract.exitCollaboratorPool();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 7: getCollaboratorSearchStatus", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test(
          "when online and no errors are shown should return a model w/ the right state",
          () async {
        when(mockRemoteSource.getCollaboratorSearchStatus())
            .thenAnswer((realInvocation) => Stream.value(true));

        final res =
            await p2pCollaboratorPoolContract.getCollaboratorSearchStatus();
        res.fold((failure) {}, (entity) {
          expect(entity.isFound, emits(true));
        });
        expect(res,
            const TypeMatcher<Right<Failure, CollaboratorSearchStatusModel>>());
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
      test("When offline should return an internet connection error", () async {
        final res =
            await p2pCollaboratorPoolContract.getCollaboratorSearchStatus();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
  group("Method No. 8: cancelStream", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online and no errors are shown should return a proper model",
          () async {
        // arrange
        when(mockRemoteSource.cancelStream()).thenAnswer((_) => true);
        // act
        final res =
            await p2pCollaboratorPoolContract.cancelCollaboratorStream();
        // assert
        expect(res, ConstantCollaboratorStreamStatusModel.wrappedSuccessCase);
      });
    });
    group("is not online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res =
            await p2pCollaboratorPoolContract.getCollaboratorSearchStatus();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
