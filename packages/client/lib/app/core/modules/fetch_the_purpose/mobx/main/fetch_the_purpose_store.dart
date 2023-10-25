// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/fetch_the_purpose/domain/domain.dart';
import 'package:primala/app/core/modules/fetch_the_purpose/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'fetch_the_purpose_store.g.dart';

class FetchThePurposeStore = _FetchThePurposeStoreBase
    with _$FetchThePurposeStore;

abstract class _FetchThePurposeStoreBase
    extends BaseMobxDBStore<NoParams, CollectivePurposeEntity> with Store {
  @observable
  String thePurpose = "";

  final FetchThePurposeGetterStore getterStore;
  _FetchThePurposeStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<CollectivePurposeEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.collectivePurposeEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.collectivePurposeEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (purposeEntity) {
      thePurpose = purposeEntity.thePurpose;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
