import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/data/data.dart';
import '../../constants/compass_event.dart';
import '../../fixtures/gyroscopic_mock_gen.mocks.dart';
import '../../../../../modules/_module_helpers/shared_mocks_gen.mocks.dart'
    show MockMNetworkInfo;
import 'package:dartz/dartz.dart';

void main() {
  late GyroscopicContractImpl contract;
  late MockMGyroscopicRemoteSource mockRemoteSource;
  late MockMNetworkInfo mockNetworkInfo;
  final tParams = NoParams();

  setUp(() {
    mockRemoteSource = MockMGyroscopicRemoteSource();
    mockNetworkInfo = MockMNetworkInfo();
    contract = GyroscopicContractImpl(
      remoteSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("Method No. 1:.", () {
    group("is Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test("when online and non-empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getDirectionAngle())
            .thenAnswer((realInvocation) => ConstantCompassEvent.successCase);
        // act
        final res = await contract.getDirectionAngle(tParams);
        // assert
        res.fold((failure) {}, (entity) {
          entity.angleStream.listen((event) {
            expect(event.heading, 95.95);
          });
        });
      });
      test("when online and empty should return a model", () async {
        // arrange
        when(mockRemoteSource.getDirectionAngle()).thenAnswer(
            (realInvocation) => ConstantCompassEvent.notSuccessCase);
        // act
        final res = await contract.getDirectionAngle(tParams);
        // assert
        res.fold((failure) {}, (entity) {
          entity.angleStream.listen((event) {
            expect(event.heading, -1);
          });
        });
      });
    });
    group("is not Online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("When offline should return an internet connection error", () async {
        final res = await contract.getDirectionAngle(tParams);
        expect(res, Left(FailureConstants.internetConnectionFailure));
      });
    });
  });
}
