import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';

import '../../../constants/entities/entities.dart';
import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockGetCollaboratorPhrase mockLogic;
  late GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  setUp(() {
    mockLogic = MockGetCollaboratorPhrase();
    getCollaboratorPhraseStore = GetCollaboratorPhraseStore(
      logic: mockLogic,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      getCollaboratorPhraseStore.stateOrErrorUpdater(
        ConstantCollaboratorPhraseEntities.wrappedSuccessCase,
      );
      expect(
        getCollaboratorPhraseStore.collaboratorPhrase,
        ConstantCollaboratorPhraseEntities.successCase.collaboratorPhrase,
      );
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => ConstantCollaboratorPhraseEntities.wrappedSuccessCase,
      );
      await getCollaboratorPhraseStore(NoParams());
      expect(
        getCollaboratorPhraseStore.collaboratorPhrase,
        ConstantCollaboratorPhraseEntities.successCase.collaboratorPhrase,
      );
      expect(getCollaboratorPhraseStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await getCollaboratorPhraseStore(NoParams());
      expect(getCollaboratorPhraseStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
