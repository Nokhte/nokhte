import 'package:nokhte/app/core/utilities/misc_algos.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/finished_collaborative_documents.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:nokhte_backend/tables/collaborator_phrases.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteSource {
  Future<List> addNamesToDatabase({String theName = ""});
  Future<List> getCollaboratorPhrase();
  Future<List> checkIfTheyHaveACollaboration();
  Future<List> checkIfTheyHaveDonePerspectives();
  Future<List> checkIfTheyHaveCommittedAPurpose();
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final P2PPerspectivesTrackingQueries perspectivesQueries;
  final FinishedCollaborativeP2PPurposeDocumentsQueries
      finishedCollaborativeP2PPurposeDocumentsQueries;

  HomeRemoteSourceImpl({required this.supabase})
      : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        perspectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        finishedCollaborativeP2PPurposeDocumentsQueries =
            FinishedCollaborativeP2PPurposeDocumentsQueries(supabase: supabase);

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

  @override
  Future<List> checkIfTheyHaveCommittedAPurpose() async =>
      await finishedCollaborativeP2PPurposeDocumentsQueries.fetchDocInfo(
          docType: 'purpose');
}
