import 'package:equatable/equatable.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';

class CollaboratorInvitationInformation extends Equatable {
  final String uid;
  final String firstName;
  const CollaboratorInvitationInformation({
    required this.firstName,
    required this.uid,
  });

  BranchUniversalObjectAndLinkProperties getBranchLinkProperties() {
    final branchObject = BranchUniversalObject(
      canonicalIdentifier: "${DeepLinkPrefixes.collaboratorCode}/$uid",
      title: "Collaborate With $firstName",
      imageUrl: DeepLinkConstants.nokhteImageURL,
    );
    final linkProperties = BranchLinkProperties(
      alias: branchObject.canonicalIdentifier,
      feature: "collaboration",
      stage: "new invitation",
    );
    return BranchUniversalObjectAndLinkProperties(
      universalObject: branchObject,
      linkProperties: linkProperties,
    );
  }

  @override
  List<Object?> get props => [firstName, uid];
}
