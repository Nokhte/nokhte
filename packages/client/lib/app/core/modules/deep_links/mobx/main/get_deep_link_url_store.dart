// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
part 'get_deep_link_url_store.g.dart';

class GetDeepLinkURLStore = _GetDeepLinkURLStoreBase with _$GetDeepLinkURLStore;

abstract class _GetDeepLinkURLStoreBase
    extends BaseMobxDBStore<GetDeepLinkURLParams, DeepLinkUrlEntity>
    with Store {
  @observable
  String link = '';

  final GetDeepLinkURL logic;
  _GetDeepLinkURLStoreBase({required this.logic});

  @observable
  BaseFutureStore<DeepLinkUrlEntity> futureStore = BaseFutureStore(
    baseEntity: Right(DeepLinkUrlEntity.initial),
    entityFutureParam: ObservableFuture(
      Future.value(Right(DeepLinkUrlEntity.initial)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (dataEntity) {
      link = dataEntity.link;
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
