// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
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
