import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/purpose_session_screens.dart';
import '../../fixtures/abort_purpose_session_mock_gen.mocks.dart';

void main() {
  late MockAbortPurposeSessionArtifactsContract mockContract;
  late AbortPurposeSessionArtifacts logic;
  final tParams = NoParams();
  const p1Params = AbortPurposeSessionArtifactsParams(
      currentScreen: PurposeSessionScreens.phase1Greeter);
  const p2Params = AbortPurposeSessionArtifactsParams(
      currentScreen: PurposeSessionScreens.phase2Consultation);
  const p3Params = AbortPurposeSessionArtifactsParams(
      currentScreen: PurposeSessionScreens.phase3IndividualReflection);
  const p4Params = AbortPurposeSessionArtifactsParams(
      currentScreen: PurposeSessionScreens.phase4ReciprocateAttention);
  const p5Params = AbortPurposeSessionArtifactsParams(
      currentScreen: PurposeSessionScreens.phase5CollectiveCreation);

  setUp(() {
    mockContract = MockAbortPurposeSessionArtifactsContract();
    logic = AbortPurposeSessionArtifacts(contract: mockContract);
  });

  test("✅ should make proper contract calls w/ phase 1", () async {
    when(mockContract.abortTheCollaboration(tParams));

    await logic(p1Params);
    verify(mockContract.abortTheCollaboration(tParams));
    verifyNever(mockContract.deleteTheTimer(tParams));
    verifyNever(mockContract.deleteSoloDocuments(tParams));
    verifyNever(mockContract.deleteWorkingCollaborativeDocument(tParams));
  });

  test("✅ should make proper contract calls w/ phase 2", () async {
    await logic(p2Params);
    verify(mockContract.abortTheCollaboration(tParams));
    verify(mockContract.deleteTheTimer(tParams));
    verifyNever(mockContract.deleteSoloDocuments(tParams));
    verifyNever(mockContract.deleteWorkingCollaborativeDocument(tParams));
  });

  test("✅ should make proper contract calls w/ phase 3", () async {
    await logic(p3Params);
    verify(mockContract.abortTheCollaboration(tParams));
    verify(mockContract.deleteTheTimer(tParams));
    verify(mockContract.deleteSoloDocuments(tParams));
    verifyNever(mockContract.deleteWorkingCollaborativeDocument(tParams));
  });

  test("✅ should make proper contract calls w/ phase 4", () async {
    await logic(p4Params);
    verify(mockContract.abortTheCollaboration(tParams));
    verify(mockContract.deleteTheTimer(tParams));
    verify(mockContract.deleteSoloDocuments(tParams));
    verifyNever(mockContract.deleteWorkingCollaborativeDocument(tParams));
  });

  test("✅ should make proper contract calls w/ phase 5", () async {
    await logic(p5Params);
    verify(mockContract.abortTheCollaboration(tParams));
    verifyNever(mockContract.deleteTheTimer(tParams));
    verify(mockContract.deleteSoloDocuments(tParams));
    verify(mockContract.deleteWorkingCollaborativeDocument(tParams));
  });
}
