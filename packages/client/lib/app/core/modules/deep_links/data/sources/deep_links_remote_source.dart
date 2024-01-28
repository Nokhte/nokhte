import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/types.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DeepLinksRemoteSource {
  Stream<Map> listenForOpenedDeepLink();
  Future<BranchResponse> getDeepLinkURL(DeepLinkTypes params);
  Future<ShareResult> sendDeepLink(String invitationURL);
}

class DeepLinksRemoteSourceImpl implements DeepLinksRemoteSource {
  final SupabaseClient supabase;
  final UserNamesQueries userNames;

  DeepLinksRemoteSourceImpl({
    required this.supabase,
  }) : userNames = UserNamesQueries(supabase: supabase);

  @override
  Stream<Map> listenForOpenedDeepLink() {
    FlutterBranchSdk.disableTracking(true);
    return FlutterBranchSdk.listSession();
  }

  @override
  Future<BranchResponse> getDeepLinkURL(params) async {
    switch (params) {
      case DeepLinkTypes.collaboratorInvitation:
        final invitationInfo = await _assembleCollaboratorInvitation();
        return await FlutterBranchSdk.getShortUrl(
          linkProperties: invitationInfo.linkProperties,
          buo: invitationInfo.universalObject,
        );
      case DeepLinkTypes.nokhteSession:
        final invitationInfo = await _assembleNokhteSessionInvitation();
        return await FlutterBranchSdk.getShortUrl(
          linkProperties: invitationInfo.linkProperties,
          buo: invitationInfo.universalObject,
        );
      default:
        return BranchResponse.error(
            errorMessage: "deep link type not specified", errorCode: "409");
    }
  }

  Future<BranchUniversalObjectAndLinkProperties>
      _assembleCollaboratorInvitation() async {
    final uid = supabase.auth.currentUser?.id ?? '';
    final firstName =
        (await userNames.getUserInfo()).first[UserNamesQueries.firstName];
    return CollaboratorInvitationInformation(
      firstName: firstName,
      uid: uid,
    ).getBranchLinkProperties();
  }

  Future<BranchUniversalObjectAndLinkProperties>
      _assembleNokhteSessionInvitation() async =>
          NokhteSessionInvitationInformation(
            senderUID: supabase.auth.currentUser?.id ?? '',
          ).getBranchLinkProperties();

  @override
  Future<ShareResult> sendDeepLink(
    String invitationURL,
  ) async =>
      await Share.shareWithResult(invitationURL);
}
