import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/utilities/misc_algos.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte_backend/tables/finished_collaborative_documents.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:share_plus/share_plus.dart';

abstract class HomeRemoteSource {
  Future<List> addNamesToDatabase({String theName = ""});
  Future<List> getCollaboratorPhrase();
  Future<List> checkIfTheyHaveACollaboration();
  Future<List> checkIfTheyHaveDonePerspectives();
  Future<List> checkIfTheyHaveCommittedAPurpose();
  Future<ShareResult> shareCollaborationInvitation(String invitationURL);
  Future<BranchResponse> getInvitationURL();
  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam);
  Future<List> updateHasGoneThroughInvitationFlow(
      bool hasGoneThroughInvitationFlowParam);
  Future<List> getUserInfo();
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final P2PPerspectivesTrackingQueries perspectivesQueries;
  final FinishedCollaborativeDocumentsQueries
      finishedCollaborativeP2PPurposeDocumentsQueries;
  final UserNamesQueries userNamesQueries;

  HomeRemoteSourceImpl({required this.supabase})
      : existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase),
        perspectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        finishedCollaborativeP2PPurposeDocumentsQueries =
            FinishedCollaborativeDocumentsQueries(supabase: supabase),
        userNamesQueries = UserNamesQueries(supabase: supabase);

  @override
  addNamesToDatabase({String theName = ""}) async {
    final List nameCheck = await userNamesQueries.getUserInfo();
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

      insertRes = await userNamesQueries.insertUserInfo(
        firstNameParam: firstName,
        lastNameParam: lastName,
      );
    } else {
      insertRes = [];
    }
    return nameCheck.isEmpty ? insertRes : nameCheck;
  }

  @override
  Future<List> checkIfTheyHaveACollaboration() async =>
      await existingCollaborationsQueries.getActiveCollaborationInfo();

  @override
  Future<List> checkIfTheyHaveDonePerspectives() async =>
      await perspectivesQueries.selectPerspectivesRow();
  @override
  Future<List> checkIfTheyHaveCommittedAPurpose() async =>
      await finishedCollaborativeP2PPurposeDocumentsQueries.getDocInfo(
          docType: 'purpose');

  @override
  Future<BranchResponse> getInvitationURL() async {
    BranchUniversalObject buo = BranchUniversalObject(
      canonicalIdentifier:
          'collaboration_code/${supabase.auth.currentUser?.id}',
      title: 'Collaborate with Person',
      imageUrl:
          'https://gitlab.com/nokhte/nokhte/-/raw/development/assets/logo.png',
    );
    BranchLinkProperties linkProperties = BranchLinkProperties(
        alias: buo.canonicalIdentifier,
        feature: 'collaboration',
        stage: 'new share',
        tags: ['one', 'two', 'three']);
    return await FlutterBranchSdk.getShortUrl(
        buo: buo, linkProperties: linkProperties);
  }

  @override
  Future<ShareResult> shareCollaborationInvitation(
    String invitationURL,
  ) async =>
      await Share.shareWithResult(invitationURL);

  @override
  Future<List> updateHasGoneThroughInvitationFlow(
          bool hasGoneThroughInvitationFlowParam) async =>
      await userNamesQueries.updateHasGoneThroughInvitationFlow(
          hasGoneThroughInvitationFlowParam);

  @override
  Future<List> updateHasSentAnInvitation(bool hasSentAnInvitationParam) async =>
      await userNamesQueries
          .updateHasSentAnInvitation(hasSentAnInvitationParam);

  @override
  Future<List> getUserInfo() async => await userNamesQueries.getUserInfo();
}
