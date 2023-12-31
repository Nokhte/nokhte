import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/types.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DeepLinksRemoteSource {
  Future<Map> getLatestOpenedDeepLink();
  Future<BranchResponse> getDeepLinkURL(GetDeepLinkURLParams params);
  Future<ShareResult> sendDeepLink(String invitationURL);
}

class DeepLinksRemoteSourceImpl implements DeepLinksRemoteSource {
  final SupabaseClient supabase;
  final UserNamesQueries userNames;

  DeepLinksRemoteSourceImpl({
    required this.supabase,
  }) : userNames = UserNamesQueries(supabase: supabase);

  @override
  Future<Map> getLatestOpenedDeepLink() async =>
      await FlutterBranchSdk.getLatestReferringParams();

  @override
  Future<BranchResponse> getDeepLinkURL(GetDeepLinkURLParams params) async {
    switch (params.type) {
      case DeepLinkTypes.collaboratorInvitation:
        final invitationInfo = await _assembleCollaboratorInvitation();
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

  @override
  Future<ShareResult> sendDeepLink(
    String invitationURL,
  ) async =>
      await Share.shareWithResult(invitationURL);
}
