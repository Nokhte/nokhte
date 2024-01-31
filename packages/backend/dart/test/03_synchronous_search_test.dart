// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/streams.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'shared/shared.dart';

void main() {
  late ExistingCollaborationsStream user1ExistingCollaborationsStreams;
  late ActiveNokhteSessionsStream user1ActiveNokhteSessionsStreams;
  late InitiateCollaboratorSearch user1StartEdgeFunctions;
  late EndCollaboratorSearch user1EndEdgeFunctions;
  late EndCollaboratorSearch user3EndEdgeFunctions;
  late InitiateCollaboratorSearch user3EdgeFunctions;
  final tSetup = CommonCollaborativeTestFunctions();

  setUpAll(() async {
    await tSetup.setUp();
    user1StartEdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user1Supabase);
    user1ActiveNokhteSessionsStreams =
        ActiveNokhteSessionsStream(supabase: tSetup.user1Supabase);
    user1EndEdgeFunctions =
        EndCollaboratorSearch(supabase: tSetup.user1Supabase);
    user3EdgeFunctions =
        InitiateCollaboratorSearch(supabase: tSetup.user3Supabase);
    user3EndEdgeFunctions =
        EndCollaboratorSearch(supabase: tSetup.user3Supabase);
    user1ExistingCollaborationsStreams =
        ExistingCollaborationsStream(supabase: tSetup.user1Supabase);
  });

  tearDownAll(() async {
    await tSetup.tearDownAll();
    await user1EndEdgeFunctions.invoke();
    await user3EndEdgeFunctions.invoke();
  });

  group("collaboration invitations", () {
    test("user should be able to enter the pool", () async {
      await user1StartEdgeFunctions.invoke(
          tSetup.thirdUserUID, InvitationType.collaborationSession);
      final firstPoolRes =
          await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

      expect(firstPoolRes.length, 1);
    });

    test("user should be able to leave the pool", () async {
      await user1EndEdgeFunctions.invoke();

      final secondPoolRes =
          await tSetup.supabaseAdmin.from('p2p_collaborator_pool').select();

      expect(secondPoolRes.length, 0);
    });

    test("user should be able to make a collaboration", () async {
      await user1StartEdgeFunctions.invoke(
          tSetup.thirdUserUID, InvitationType.collaborationSession);
      await user3EdgeFunctions.invoke(
          tSetup.firstUserUID, InvitationType.collaborationSession);
      final user1Stream = user1ExistingCollaborationsStreams
          .getCollaboratorSearchAndEntryStatus();
      expect(user1Stream, emits(true));
    });
  });

  group("nokhte invitations", () {
    test("user should be able to make a nokhte session", () async {
      final firstStream = user1ActiveNokhteSessionsStreams
          .getActiveNokhteSessionCreationStatus();
      await user1StartEdgeFunctions.invoke(
          tSetup.firstUserUID, InvitationType.nokhteSession);
      expect(firstStream, emits(false));
    });

    test("user should be able to make a nokhte session", () async {
      await user3EdgeFunctions.invoke(
          tSetup.firstUserUID, InvitationType.nokhteSession);
      final secondStream = user1ActiveNokhteSessionsStreams
          .getActiveNokhteSessionCreationStatus();
      expect(secondStream, emits(true));
    });
  });

  group("_getInvitationType", () {
    test(
        "_getInvitationType(InvitationType.nokhteSession) should return 'NOKHTE_SESSION'",
        () {
      final result = user1StartEdgeFunctions
          .getInvitationType(InvitationType.nokhteSession);
      expect(result, 'NOKHTE_SESSION');
    });

    test(
        "_getInvitationType(InvitationType.collaborationSession) should return 'COLLABORATION_SESSION'",
        () {
      final result = user1StartEdgeFunctions
          .getInvitationType(InvitationType.collaborationSession);
      expect(result, 'COLLABORATION_SESSION');
    });
  });
}
