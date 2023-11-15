import 'package:nokhte/app/core/utilities/misc_algos.dart';
import 'package:nokhte_backend/existing_collaborations.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/user_names.dart';
import 'package:nokhte_backend/collaborator_phrases.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteSource {
  Future<List> addNamesToDatabase({String theName = ""});
  Future<List> getCollaboratorPhrase();
  Future<List> checkIfTheyHaveACollaboration();
  Future<List> checkIfTheyHaveDonePerspectives();
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final P2PPerspectivesTrackingQueries perspectivesQueries;

  HomeRemoteSourceImpl({required this.supabase})
      : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        perspectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase);

  // @override
  // addNamesToDatabase({String theName = ""}) async {
  //   String fullName;
  //   if (theName.isEmpty) {
  //     fullName = supabase.auth.currentUser?.userMetadata?["full_name"] ??
  //         supabase.auth.currentUser?.userMetadata?["name"] ??
  //         supabase.auth.currentUser?.userMetadata?["email"];
  //   } else {
  //     fullName = theName;
  //   }
  //   final [firstName, lastName] = MiscAlgos.returnSplitName(fullName);

  //   final List nameCheck = await CommonUserNamesQueries.fetchUserInfo(
  //     supabase: supabase,
  //     userUID: supabase.auth.currentUser?.id ?? '',
  //   );

  //   List insertRes;
  //   if (nameCheck.isEmpty) {
  //     insertRes = await CommonUserNamesQueries.insertUserInfo(
  //       supabase: supabase,
  //       userUID: supabase.auth.currentUser?.id,
  //       firstName: firstName,
  //       lastName: lastName,
  //     );
  //   } else {
  //     insertRes = [];
  //   }
  //   return nameCheck.isEmpty ? insertRes : nameCheck;
  // }

  @override
  addNamesToDatabase({String theName = ""}) async {
    final List nameCheck = await CommonUserNamesQueries.fetchUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id ?? '',
    );
    List insertRes;
    String fullName;
    if (nameCheck.isEmpty) {
      if (theName.isEmpty) {
        fullName = supabase.auth.currentUser?.userMetadata?["full_name"] ??
            supabase.auth.currentUser?.userMetadata?["name"] ??
            supabase.auth.currentUser?.userMetadata?["email"];
      } else {
        fullName = theName;
      }
      final [firstName, lastName] = MiscAlgos.returnSplitName(fullName);

      insertRes = await CommonUserNamesQueries.insertUserInfo(
        supabase: supabase,
        userUID: supabase.auth.currentUser?.id,
        firstName: firstName,
        lastName: lastName,
      );
    } else {
      insertRes = [];
    }
    return nameCheck.isEmpty ? insertRes : nameCheck;
  }

  @override
  Future<List> getCollaboratorPhrase() async {
    return await CollaboratorPhraseQueries.fetchUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id,
    );
  }

  @override
  Future<List> checkIfTheyHaveACollaboration() async =>
      await existingCollaborationsQueries.fetchActiveCollaborationInfo();

  @override
  Future<List> checkIfTheyHaveDonePerspectives() async =>
      await perspectivesQueries.selectPerspectivesRow();
}
