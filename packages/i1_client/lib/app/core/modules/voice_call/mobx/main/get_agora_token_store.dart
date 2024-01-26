// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'get_agora_token_store.g.dart';

class GetAgoraTokenStore = _GetAgoraTokenStoreBase with _$GetAgoraTokenStore;

abstract class _GetAgoraTokenStoreBase
    extends BaseMobxDBStore<GetAgoraTokenParams, AgoraCallTokenEntity>
    with Store {
  final GetAgoraToken logic;

  _GetAgoraTokenStoreBase({required this.logic});

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
  Future<void> call(dynamic params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
