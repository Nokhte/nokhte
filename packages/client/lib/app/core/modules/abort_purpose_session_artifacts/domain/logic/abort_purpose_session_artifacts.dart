import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/purpose_session_screens.dart';

class AbortPurposeSessionArtifacts
    implements
        AbstractFutureLogic<PurposeSessionArtifactAbortionStatusEntity,
            AbortPurposeSessionArtifactsParams> {
  final AbortPurposeSessionArtifactsContract contract;

  AbortPurposeSessionArtifacts({required this.contract});

  bool isPhase2(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase2Consultation;

  bool isPhase3(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase3IndividualReflection;

  bool isPhase4(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase4ReciprocateAttention;

  bool isPhase5(PurposeSessionScreens screen) =>
      screen == PurposeSessionScreens.phase5CollectiveCreation;

  bool shouldDeleteSoloDocument(PurposeSessionScreens screen) =>
      isPhase3(screen) || isPhase4(screen) || isPhase5(screen);

  bool shouldDeleteTimer(PurposeSessionScreens screen) =>
      isPhase2(screen) || isPhase3(screen) || isPhase4(screen);

  bool shouldDeleteCollaborativeDocument(PurposeSessionScreens screen) =>
      isPhase5(screen);

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

class AbortPurposeSessionArtifactsParams extends Equatable {
  final PurposeSessionScreens currentScreen;
  const AbortPurposeSessionArtifactsParams({
    required this.currentScreen,
  });

  @override
  List<Object> get props => [currentScreen];
}
