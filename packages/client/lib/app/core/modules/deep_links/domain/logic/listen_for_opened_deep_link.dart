import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

class ListenForOpenedDeepLink
    implements AbstractNoFailureStreamLogic<Map, NoParams> {
  final DeepLinksContract contract;

  ListenForOpenedDeepLink({required this.contract});

  @override
  call(params) => contract.listenForOpenedDeepLink(params);
}
