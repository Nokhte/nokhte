// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
part 'get_timer_information_stream_store.g.dart';

class GetTimerInformationStreamStore = _GetTimerInformationStreamStoreBase
    with _$GetTimerInformationStreamStore;

abstract class _GetTimerInformationStreamStoreBase
    extends BaseMobxDBStore<NoParams, TimerInformationStreamEntity> with Store {
  @observable
  ObservableStream<PresenceAndTimeRemaining> timerInformationStream =
      ObservableStream(DefaultEntities.timerInformationStream);

  final GetTimerInformationStreamGetterStore getterStore;
  _GetTimerInformationStreamStoreBase({required this.getterStore});

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    final result = await getterStore(NoParams());
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (timerInformationEntity) {
      timerInformationStream = ObservableStream(
        timerInformationEntity.theTimeStream,
      );
      state = StoreState.loaded;
    });
  }
}
