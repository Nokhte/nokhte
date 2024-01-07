import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

class GetLatestOpenedDeepLink
    implements AbstractFutureLogic<DeepLinkInfoEntity, NoParams> {
  final DeepLinksContract contract;

  GetLatestOpenedDeepLink({required this.contract});

  @override
  call(params) async => await contract.getLatestOpenedDeeplink(params);
}
