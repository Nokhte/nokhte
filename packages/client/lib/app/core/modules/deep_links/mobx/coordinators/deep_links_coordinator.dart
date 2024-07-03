// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
part 'deep_links_coordinator.g.dart';

class DeepLinksCoordinator = _DeepLinksCoordinatorBase
    with _$DeepLinksCoordinator;

abstract class _DeepLinksCoordinatorBase with Store, BaseMobxLogic {
  final GetDeepLinkURL getDeepLinkUrlLogic;
  final ListenForOpenedDeepLinkStore listenForOpenedDeepLinkStore;

  _DeepLinksCoordinatorBase({
    required this.getDeepLinkUrlLogic,
    required this.listenForOpenedDeepLinkStore,
  }) {
    initBaseLogicActions();
  }

  @observable
  String link = "";

  @action
  getDeepLink(DeepLinkTypes params) async {
    setState(StoreState.loading);
    final res = await getDeepLinkUrlLogic(params);
    res.fold((failure) => errorUpdater(failure), (url) => link = url);
    setState(StoreState.loaded);
  }

  @action
  reset() => listenForOpenedDeepLinkStore.reset();

  @action
  listen() => listenForOpenedDeepLinkStore(NoParams());

  dispose() async => await listenForOpenedDeepLinkStore.dispose();
}
