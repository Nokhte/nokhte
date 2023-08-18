// * testing lib
import 'package:flutter_test/flutter_test.dart';
// * mocking lib
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
// * primala core imports
import 'package:primala/app/modules/home/data/contracts/home_contract_impl.dart';
// * mock import
import '../../constants/models/models.dart';
import '../../constants/data/data.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
// * functional programming
import 'package:dartz/dartz.dart';

void main() {
  late HomeContractImpl homeContract;
  late MockMRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteSource = MockMRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    homeContract = HomeContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("Method No. 1: addNameToDatabase", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.addNamesToDatabase())
            .thenAnswer((realInvocation) async => [{}]);
        // act
        final res = await homeContract.addNameToDatabase();
        // assert
        expect(res, ConstantNameCreationStatusModels.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.addNamesToDatabase())
            .thenAnswer((realInvocation) async => []);
        // act
        final res = await homeContract.addNameToDatabase();
        // assert
        expect(res, ConstantNameCreationStatusModels.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.addNameToDatabase();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });

  group("Method No. 2: getCollaboratorPhrase", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getCollaboratorPhrase())
            .thenAnswer((realInvocation) async => SampleSupabaseRes.res);
        // act
        final res = await homeContract.getCollaboratorPhrase();
        // assert
        expect(res, ConstantCollaboratorPhraseModels.wrappedSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.getCollaboratorPhrase();
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}

// after this move on to the sources & testing those & we should be done with
// this features!!
