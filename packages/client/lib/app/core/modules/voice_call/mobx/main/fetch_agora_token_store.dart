// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'fetch_agora_token_store.g.dart';

class FetchAgoraTokenStore = _FetchAgoraTokenStoreBase
    with _$FetchAgoraTokenStore;

abstract class _FetchAgoraTokenStoreBase
    extends BaseMobxDBStore<FetchAgoraTokenParams, AgoraCallTokenEntity>
    with Store {
  //

  final FetchAgoraTokenGetterStore getterStore;

  _FetchAgoraTokenStoreBase({required this.getterStore});

  @observable
  BaseFutureStore<AgoraCallTokenEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultCallTokenEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.defaultCallTokenEntity),
    ),
  );

  @observable
  String token = '';

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (tokenEntity) {
      token = tokenEntity.returnedToken;
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
