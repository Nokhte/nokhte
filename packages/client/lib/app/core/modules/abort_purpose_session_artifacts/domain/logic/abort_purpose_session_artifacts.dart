import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/purpose_session_screens.dart';

class AbortPurposeSessionArtifacts
    implements
        AbstractFutureLogic<PurposeSessionArtifactAbortionStatusEntity,
            AbortThePurposeSessionParams> {
  final AbortPurposeSessionArtifactsContract contract;

  AbortPurposeSessionArtifacts({required this.contract});

  bool shouldDeleteSoloDocument(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase3IndividualReflection ||
      screen == PurposeSessionScreens.phase4ReciprocateAttention ||
      screen == PurposeSessionScreens.phase5CollectiveCreation;

  bool shouldDeleteTimer(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase2Consultation ||
      screen == PurposeSessionScreens.phase3IndividualReflection ||
      screen == PurposeSessionScreens.phase4ReciprocateAttention;

  bool shouldDeleteCollaborativeDocument(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase5CollectiveCreation;

  Future<void> handleAbortionForScreen(PurposeSessionScreens screen) async {
    await contract.abortTheCollaboration(NoParams());

    if (shouldDeleteSoloDocument(screen)) {
      await contract.deleteSoloDocuments(NoParams());
    }

    if (shouldDeleteTimer(screen)) {
      await contract.deleteTheTimer(NoParams());
    }

    if (shouldDeleteCollaborativeDocument(screen)) {
      await contract.deleteWorkingCollaborativeDocument(NoParams());
    }
  }

  @override
  call(params) async {
    await handleAbortionForScreen(params.currentScreen);
    return const Right(
      PurposeSessionArtifactAbortionStatusEntity(
        isAborted: true,
      ),
    );
  }
}

class AbortThePurposeSessionParams extends Equatable {
  final PurposeSessionScreens currentScreen;
  const AbortThePurposeSessionParams({required this.currentScreen});

  @override
  List<Object> get props => [currentScreen];
}
