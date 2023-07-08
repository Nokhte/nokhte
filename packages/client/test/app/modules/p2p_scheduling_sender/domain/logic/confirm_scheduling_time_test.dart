// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import '../../constants/param/confirm_param_entities.dart';
import '../../constants/return/confirm/confirm_scheduling_time_status_entities.dart';
import '../../constants/sample_data.dart';
import '../../fixtures/p2p_scheduling_sender_mock_gen.mocks.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';

void main() {
  late MockMP2PSchedulingSenderContract mockContract;
  late ConfirmSchedulingTime logic;

  setUp(() {
    mockContract = MockMP2PSchedulingSenderContract();
    logic = ConfirmSchedulingTime(contract: mockContract);
  });
  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.confirmSchedulingTime(receiverUID: SampleData.randomUID))
        .thenAnswer(
      (_) async =>
          ConstantConfirmSchedulingTimeStatusEntities.wrappedSuccessCase,
    );

    final result = await logic(ConstantConfirmParamEntities.entity);

    expect(
        result, ConstantConfirmSchedulingTimeStatusEntities.wrappedSuccessCase);
    verify(
        mockContract.confirmSchedulingTime(receiverUID: SampleData.randomUID));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.confirmSchedulingTime(receiverUID: SampleData.randomUID))
        .thenAnswer((_) async => Left(FailureConstants.dbFailure));

    final result = await logic(ConstantConfirmParamEntities.entity);

    expect(result, Left(FailureConstants.dbFailure));
    verify(
        mockContract.confirmSchedulingTime(receiverUID: SampleData.randomUID));
    verifyNoMoreInteractions(mockContract);
  });
}
