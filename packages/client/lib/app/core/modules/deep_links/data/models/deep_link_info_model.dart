import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

class DeepLinkInfoModel extends DeepLinkInfoEntity {
  const DeepLinkInfoModel({
    required super.type,
    super.additionalMetadata,
  });

  factory DeepLinkInfoModel.fromBranch(Map<dynamic, dynamic> sessionMap) {
    const defaultEntity = DeepLinkInfoModel(type: DeepLinkTypes.none);
    if (sessionMap.isEmpty) return defaultEntity;

    final List<String> splitLink =
        sessionMap["\$canonical_identifier"].split('/');
    final String linkType = splitLink.first;

    return linkType == DeepLinkPrefixes.collaboratorCode
        ? DeepLinkInfoModel(
            type: DeepLinkTypes.collaboratorInvitation,
            additionalMetadata: {"collaboratorUID": splitLink[1]},
          )
        : defaultEntity;
  }
}
