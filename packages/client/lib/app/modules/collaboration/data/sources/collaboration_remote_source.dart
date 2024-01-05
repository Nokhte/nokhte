import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollaborationRemoteSource {
  Future<ShareResult> shareCollaborationInvitation(String invitationURL);
  Future<BranchResponse> getInvitationURL();
}

class CollaborationRemoteSourceImpl implements CollaborationRemoteSource {
  final SupabaseClient supabase;

  CollaborationRemoteSourceImpl({
    required this.supabase,
  });
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
}
