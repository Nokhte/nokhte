// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';
part 'get_latest_opened_deep_link_store.g.dart';

class GetLatestOpenedDeepLinkStore = _GetLatestOpenedDeepLinkStoreBase
    with _$GetLatestOpenedDeepLinkStore;

abstract class _GetLatestOpenedDeepLinkStoreBase
    extends BaseMobxDBStore<NoParams, DeepLinkInfoEntity> with Store {
  @observable
  DeepLinkTypes deepLinkType = DeepLinkTypes.none;

  @observable
  ObservableMap additionalMetadata = ObservableMap.of({});

  final GetLatestOpenedDeepLink logic;
  _GetLatestOpenedDeepLinkStoreBase({required this.logic});

  @observable
  BaseFutureStore<DeepLinkInfoEntity> futureStore = BaseFutureStore(
    baseEntity: Right(DeepLinkInfoEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(DeepLinkInfoEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (latestOpenedDeepLinkEntity) {
      deepLinkType = latestOpenedDeepLinkEntity.type;
      additionalMetadata = ObservableMap.of(
        latestOpenedDeepLinkEntity.additionalMetadata,
      );
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
