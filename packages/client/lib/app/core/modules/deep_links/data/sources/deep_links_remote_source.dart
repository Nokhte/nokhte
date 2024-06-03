import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DeepLinksRemoteSource {
  Stream<Map> listenForOpenedDeepLink();
  Future<BranchResponse> getDeepLinkURL(DeepLinkTypes params);
}

class DeepLinksRemoteSourceImpl implements DeepLinksRemoteSource {
  final SupabaseClient supabase;
  final UserInformationQueries userNames;
  final STActiveNokhteSessionQueries activeNokhteSession;

  DeepLinksRemoteSourceImpl({
    required this.supabase,
  })  : userNames = UserInformationQueries(supabase: supabase),
        activeNokhteSession = STActiveNokhteSessionQueries(supabase: supabase);

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
      case DeepLinkTypes.nokhteSessionLeader:
        final invitationInfo = await _assembleNokhteSessionLeaderInvitation();
        return await FlutterBranchSdk.getShortUrl(
          linkProperties: invitationInfo.linkProperties,
          buo: invitationInfo.universalObject,
        );
      case DeepLinkTypes.nokhteSessionBearer:
        final invitationInfo = await _assembleNokhteSessionBearerInvitation();
        return await FlutterBranchSdk.getShortUrl(
          linkProperties: invitationInfo.linkProperties,
          buo: invitationInfo.universalObject,
        );
      //
      default:
        return BranchResponse.error(
            errorMessage: "deep link type not specified", errorCode: "409");
    }
  }

  Future<BranchUniversalObjectAndLinkProperties>
      _assembleCollaboratorInvitation() async {
    final uid = supabase.auth.currentUser?.id ?? '';
    final firstName = (await userNames.getUserInfo()).first['first_name'];
    return CollaboratorInvitationInformation(
      firstName: firstName,
      uid: uid,
    ).getBranchLinkProperties();
  }

  Future<BranchUniversalObjectAndLinkProperties>
      _assembleNokhteSessionLeaderInvitation() async =>
          NokhteSessionInvitationInformation(
            senderUID: supabase.auth.currentUser?.id ?? '',
          ).getBranchLinkProperties();

  Future<BranchUniversalObjectAndLinkProperties>
      _assembleNokhteSessionBearerInvitation() async {
    final sessionLeaderUID = await activeNokhteSession.getLeaderUID();
    return NokhteSessionInvitationInformation(
      senderUID: sessionLeaderUID,
    ).getBranchLinkProperties();
  }
}
