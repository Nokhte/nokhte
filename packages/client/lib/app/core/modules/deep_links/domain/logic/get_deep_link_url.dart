import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';

class GetDeepLinkURL implements AbstractFutureLogic<String, DeepLinkTypes> {
  final DeepLinksContract contract;

  GetDeepLinkURL({required this.contract});

  @override
  call(params) async => await contract.getDeepLinkURL(params);
}
