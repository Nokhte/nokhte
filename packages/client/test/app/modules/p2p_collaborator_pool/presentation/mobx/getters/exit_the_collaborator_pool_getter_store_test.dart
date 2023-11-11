import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/getters/getters.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMExitCollaboratorPool mockLogic;
  late ExitCollaboratorPoolGetterStore getterStore;
  late Either<Failure, CollaboratorPoolExitStatusEntity> tEitherStatusOrFailure;

  setUp(() {
    mockLogic = MockMExitCollaboratorPool();
    getterStore = ExitCollaboratorPoolGetterStore(exitPoolLogic: mockLogic);
  });

  group("✅ Success Cases", () {
    setUp(() {
      tEitherStatusOrFailure =
          ConstantCollaboratorPoolExitStatusEntity.wrappedSuccessCase;
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore();
      expect(res, tEitherStatusOrFailure);
    });
  });

  group("❌ Failure Cases", () {
    setUp(() {
      tEitherStatusOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      when(mockLogic(NoParams()))
          .thenAnswer((realInvocation) async => tEitherStatusOrFailure);
      final res = await getterStore();
      expect(res, tEitherStatusOrFailure);
    });
  });
}
