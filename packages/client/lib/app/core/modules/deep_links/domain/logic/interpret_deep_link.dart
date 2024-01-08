import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

class InterpretDeepLink
    implements AbstractSyncNoFailureLogic<InterpretedDeepLinkEntity, Map> {
  @override
  call(params) {
    const defaultEntity = InterpretedDeepLinkEntity();
    if (params.isEmpty) return defaultEntity;

    final List<String> splitLink = params["\$canonical_identifier"].split('/');
    final String linkType = splitLink.first;

    if (linkType == DeepLinkPrefixes.collaboratorCode) {
      return InterpretedDeepLinkEntity(
        path: "/collaboration/",
        additionalMetadata: {"collaboratorUID": splitLink[1]},
      );
    } else {
      return defaultEntity;
    }
  }
}
