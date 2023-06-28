import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/confirm_scheduling_time_getter_store.dart';
import '../../../constants/param/confirm_param_entities.dart';
import '../../../constants/return/confirm/confirm_scheduling_time_status_entities.dart';
import '../../../fixtures/p2p_scheduling_sender_mock_gen.mocks.dart';

void main() {
  late MockMConfirmSchedulingTime mockLogic;
  late ConfirmSchedulingTimeGetterStore getterStore;
  late Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>
      tEitherStatusOrFailure;

  setUp(() {
    mockLogic = MockMConfirmSchedulingTime();
    getterStore = ConfirmSchedulingTimeGetterStore(
      confirmSchedulingTimeLogic: mockLogic,
    );
  });
  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantConfirmSchedulingTimeStatusEntities.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(ConstantConfirmParamEntities.entity)).thenAnswer(
        (_) async => tEitherStatusOrFailure,
      );
      final res = await getterStore(ConstantConfirmParamEntities.entity);
      expect(res, tEitherStatusOrFailure);
    });
  });
  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test('should pass a failure correctly', () async {
      when(mockLogic(ConstantConfirmParamEntities.entity)).thenAnswer(
        (_) async => tEitherStatusOrFailure,
      );
      final res = await getterStore(ConstantConfirmParamEntities.entity);
      expect(res, tEitherStatusOrFailure);
    });
  });
}
