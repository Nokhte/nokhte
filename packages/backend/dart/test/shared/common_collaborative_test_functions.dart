import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommonCollaborativeTestFunctions {
  late SupabaseClient user1Supabase;
  late SupabaseClient user2Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTrackingQueries user1PerspectivesQueries;
  late P2PPerspectivesTrackingQueries adminPerspectivesQueries;

  final tPerspectives = ['pERSPECTIVE1', 'peRSPECTIVE2', 'perSPECTIVE 3'];

  CommonCollaborativeTestFunctions() {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    user2Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
  }

  Future<void> setUp({
    bool shouldSetupPerspectives = false,
    bool shouldMakeCollaboration = true,
  }) async {
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user2(supabase: user2Supabase);

    final userIdResults = await UserSetupConstants.getUIDs();
    firstUserUID = userIdResults.first;
    secondUserUID = userIdResults[1];

    existingCollaborationsQueries =
        ExistingCollaborationsQueries(supabase: supabaseAdmin);
    if (shouldMakeCollaboration) {
      await existingCollaborationsQueries.createNewCollaboration(
        collaboratorOneUID: firstUserUID,
        collaboratorTwoUID: secondUserUID,
      );
    }

    adminPerspectivesQueries =
        P2PPerspectivesTrackingQueries(supabase: supabaseAdmin);

    user1PerspectivesQueries =
        P2PPerspectivesTrackingQueries(supabase: user1Supabase);
    if (shouldSetupPerspectives) {
      await user1PerspectivesQueries.insertNewPerspectives(
        newPerspectives: tPerspectives,
      );
    }
  }

  Future<void> tearDownAll({
    bool shouldTearDownPerspectives = false,
    bool shouldTeardownCollaboration = true,
  }) async {
    existingCollaborationsQueries.currentUserUID = firstUserUID;
    adminPerspectivesQueries.collaboratorInfo =
        user1PerspectivesQueries.collaboratorInfo;
    if (shouldTeardownCollaboration) {
      await existingCollaborationsQueries.deleteExistingCollaboration();
    }

    if (shouldTearDownPerspectives) {
      adminPerspectivesQueries.deletePerspectivesRow();
    }
  }
}
