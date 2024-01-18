// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'get_channel_id_store.g.dart';

class GetChannelIdStore = _GetChannelIdStoreBase with _$GetChannelIdStore;

abstract class _GetChannelIdStoreBase
    extends BaseMobxDBStore<NoParams, ChannelIdEntity> with Store {
  final GetChannelId logic;

  _GetChannelIdStoreBase({
    required this.logic,
  });

  @observable
  String channelId = '';

  @observable
  BaseFutureStore<ChannelIdEntity> futureStore = BaseFutureStore(
    baseEntity: Right(ChannelIdEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(ChannelIdEntity.initial())),
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
    futureStore.entityOrFailureFuture = ObservableFuture(logic(NoParams()));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
