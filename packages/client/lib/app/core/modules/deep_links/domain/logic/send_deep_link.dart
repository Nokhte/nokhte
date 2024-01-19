import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

class SendDeepLink implements AbstractFutureLogic<bool, String> {
  final DeepLinksContract contract;

  SendDeepLink({required this.contract});

  @override
  call(params) async => await contract.sendDeepLink(params);
}
