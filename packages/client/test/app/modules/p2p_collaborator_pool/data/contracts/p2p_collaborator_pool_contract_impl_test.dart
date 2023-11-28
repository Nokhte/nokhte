import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/types/collaborator_search_and_entry_status.dart';
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

  group("Method No. 4: validateQuery", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });
      test("when online and non-empty should return a false model", () async {
        when(mockRemoteSource.validateQuery(query: "some phrase"))
            .thenAnswer((realInvocation) async => [
                  [
                    {"id": 1}
                  ],
                  [
                    {"id": 1}
                  ]
                ]);
        final res =
            await p2pCollaboratorPoolContract.validateQuery("some phrase");
        expect(
            res, ConstantCollaboratorPhraseValidationModel.wrappedSuccessCase);
      });
      test("when online and empty should return a true model", () async {
        when(mockRemoteSource.validateQuery(query: "some phrase"))
            .thenAnswer((realInvocation) async => [[], []]);
        final res =
            await p2pCollaboratorPoolContract.validateQuery("some phrase");
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
        when(mockRemoteSource.enterThePool(PhraseIDs.phraseID))
            .thenAnswer((realInvocation) async => FunctionResponses.successRes);
        final res = await p2pCollaboratorPoolContract
            .enterTheCollaboratorPool(PhraseIDs.phraseID);
        expect(
            res, ConstantCollaboratorPoolEntryStatusModel.wrappedSuccessCase);
      });
      test("when online w/ a non 200  should return a not successful model",
          () async {
        when(mockRemoteSource.enterThePool(PhraseIDs.phraseID)).thenAnswer(
            (realInvocation) async => FunctionResponses.notSuccessRes);
        final res = await p2pCollaboratorPoolContract
            .enterTheCollaboratorPool(PhraseIDs.phraseID);
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
        final res = await p2pCollaboratorPoolContract
            .enterTheCollaboratorPool(PhraseIDs.phraseID);
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
        when(mockRemoteSource.exitThePool())
            .thenAnswer((realInvocation) async => FunctionResponses.successRes);
        final res = await p2pCollaboratorPoolContract.exitCollaboratorPool();
        expect(res, ConstantCollaboratorPoolExitStatusModel.wrappedSuccessCase);
      });
      test("when online w/ a non 200  should return a not successful model",
          () async {
        when(mockRemoteSource.exitThePool()).thenAnswer(
            (realInvocation) async => FunctionResponses.notSuccessRes);
        final res = await p2pCollaboratorPoolContract.exitCollaboratorPool();
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
        when(mockRemoteSource.getCollaboratorSearchStatus()).thenAnswer(
            (realInvocation) => ConstantCollaboratorSearchStatusStatusModel
                .successCase.searchAndEntryStatusStream);

        final res =
            await p2pCollaboratorPoolContract.getCollaboratorSearchStatus();
        res.fold((failure) {}, (entity) {
          expect(
              entity.searchAndEntryStatusStream,
              emits(CollaboratorSearchAndEntryStatus(
                  hasEntered: false, hasFoundTheirCollaborator: true)));
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
        when(mockRemoteSource.cancelStream()).thenAnswer((_) => true);
        final res =
            await p2pCollaboratorPoolContract.cancelCollaboratorStream();
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
