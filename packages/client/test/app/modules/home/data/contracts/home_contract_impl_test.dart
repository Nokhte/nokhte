import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/data/contracts/home_contract_impl.dart';
import '../../constants/models/models.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';
import '../../../_module_helpers/shared_mocks_gen.mocks.dart';
import 'package:dartz/dartz.dart';

void main() {
  late HomeContractImpl homeContract;
  late MockHomeRemoteSource mockRemoteSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteSource = MockHomeRemoteSource();
    mockNetworkInfo = MockNetworkInfo();
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
        when(mockRemoteSource.addNamesToDatabase())
            .thenAnswer((realInvocation) async => [{}]);
        final res = await homeContract.addNameToDatabase(NoParams());
        expect(res, ConstantNameCreationStatusModels.wrappedSuccessCase);
      });
      test("when online and empty should return a model", () async {
        when(mockRemoteSource.addNamesToDatabase())
            .thenAnswer((realInvocation) async => []);
        final res = await homeContract.addNameToDatabase(NoParams());
        expect(res, ConstantNameCreationStatusModels.wrappedNotSuccessCase);
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await homeContract.addNameToDatabase(NoParams());
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
