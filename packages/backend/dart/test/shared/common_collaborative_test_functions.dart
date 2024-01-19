import 'package:nokhte_backend/constants/constants.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommonCollaborativeTestFunctions {
  late SupabaseClient user1Supabase;
  late SupabaseClient user2Supabase;
  late SupabaseClient user3Supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late String thirdUserUID;
  late ExistingCollaborationsQueries existingCollaborationsQueries;
  late P2PPerspectivesTrackingQueries user1PerspectivesQueries;
  late P2PPerspectivesTrackingQueries adminPerspectivesQueries;

  final tPerspectives = ['pERSPECTIVE1', 'peRSPECTIVE2', 'perSPECTIVE 3'];

  CommonCollaborativeTestFunctions() {
    user1Supabase = SupabaseClientConfigConstants.supabase;
    user2Supabase = SupabaseClientConfigConstants.supabase;
    user3Supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
  }

  Future<void> setUp({
    bool shouldSetupPerspectives = false,
    bool shouldMakeCollaboration = true,
  }) async {
    await SignIn.user1(supabase: user1Supabase);
    await SignIn.user2(supabase: user2Supabase);
    await SignIn.user3(supabase: user3Supabase);

    final userIdResults = await UserSetupConstants.getUIDs();
    firstUserUID = userIdResults.first;
    secondUserUID = userIdResults[1];
    thirdUserUID = userIdResults[2];

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
      await supabaseAdmin.from('existing_collaborations').delete().or(
          'collaborator_one.eq.$firstUserUID,collaborator_two.eq.$firstUserUID,collaborator_one.eq.$secondUserUID,collaborator_two.eq.$secondUserUID,collaborator_one.eq.$thirdUserUID,collaborator_two.eq.$thirdUserUID');
    }

    if (shouldTearDownPerspectives) {
      adminPerspectivesQueries.deletePerspectivesRow();
    }
  }
}
