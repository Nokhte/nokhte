// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'fetch_channel_id_store.g.dart';

class FetchChannelIdStore = _FetchChannelIdStoreBase with _$FetchChannelIdStore;

abstract class _FetchChannelIdStoreBase
    extends BaseMobxDBStore<NoParams, ChannelIdEntity> with Store {
  final FetchChannelIdGetterStore getterStore;

  _FetchChannelIdStoreBase({
    required this.getterStore,
  });

  @observable
  String channelId = '';

  @observable
  BaseFutureStore<ChannelIdEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultChannelIdEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.defaultChannelIdEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (channelIdEntity) {
      channelId = channelIdEntity.channelId;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore());
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
