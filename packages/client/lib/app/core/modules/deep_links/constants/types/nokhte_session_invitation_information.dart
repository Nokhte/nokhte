import 'package:equatable/equatable.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';

class NokhteSessionInvitationInformation extends Equatable {
  final String senderUID;

  const NokhteSessionInvitationInformation({required this.senderUID});

  BranchUniversalObjectAndLinkProperties getBranchLinkProperties() {
    final branchObject = BranchUniversalObject(
      canonicalIdentifier: "${DeepLinkPrefixes.nokhteCode}/$senderUID",
      title: "Join Nokhte Session",
      imageUrl: DeepLinkConstants.nokhteImageURL,
    );
    final linkProperties = BranchLinkProperties(
      alias: branchObject.canonicalIdentifier,
      feature: "nokhte_session",
      stage: "new invitation",
    );
    return BranchUniversalObjectAndLinkProperties(
      universalObject: branchObject,
      linkProperties: linkProperties,
    );
  }

  @override
  List<Object> get props => [senderUID];
}
