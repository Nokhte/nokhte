// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
part 'deep_links_coordinator.g.dart';

class DeepLinksCoordinator = _DeepLinksCoordinatorBase
    with _$DeepLinksCoordinator;

abstract class _DeepLinksCoordinatorBase extends BaseMobxDBStore with Store {
  final GetDeepLinkURL getDeepLinkUrlLogic;
  final SendDeepLink sendDeepLinkLogic;
  final ListenForOpenedDeepLinkStore listenForOpenedDeepLinkStore;

  _DeepLinksCoordinatorBase({
    required this.getDeepLinkUrlLogic,
    required this.sendDeepLinkLogic,
    required this.listenForOpenedDeepLinkStore,
  });

  @observable
  String link = "";

  @observable
  bool isShared = false;

  @action
  getDeepLink(DeepLinkTypes params) async {
    state = StoreState.loading;
    final res = await getDeepLinkUrlLogic(params);
    res.fold((failure) => errorUpdater(failure), (url) => link = url);
    state = StoreState.loaded;
  }

  @action
  share(String link) async {
    state = StoreState.loading;
    final res = await sendDeepLinkLogic(link);
    res.fold((failure) => errorUpdater(failure),
        (isShared) => this.isShared = isShared);
    state = StoreState.loaded;
  }

  @action
  listen() => listenForOpenedDeepLinkStore(NoParams());
}
