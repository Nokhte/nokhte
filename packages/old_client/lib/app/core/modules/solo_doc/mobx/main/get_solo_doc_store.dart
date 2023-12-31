// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
part 'get_solo_doc_store.g.dart';

class GetSoloDocStore = _GetSoloDocStoreBase with _$GetSoloDocStore;

abstract class _GetSoloDocStoreBase
    extends BaseMobxDBStore<GetSoloDocParams, SoloDocContentEntity> with Store {
  final GetSoloDoc logic;

  @observable
  String docContent = "";

  _GetSoloDocStoreBase({
    required this.logic,
  });

  @observable
  BaseFutureStore<SoloDocContentEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultSoloDocContentEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultSoloDocContentEntity,
      ),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (soloDocContentEntity) {
      docContent = soloDocContentEntity.content;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      logic(
        params,
      ),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
