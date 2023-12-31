// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';
part 'get_current_perspectives_store.g.dart';

class GetCurrentPerspectivesStore = _GetCurrentPerspectivesStoreBase
    with _$GetCurrentPerspectivesStore;

abstract class _GetCurrentPerspectivesStoreBase
    extends BaseMobxDBStore<NoParams, CurrentPerspectivesEntity> with Store {
  @observable
  ObservableList currentPerspectives = ObservableList.of([]);

  @observable
  DateTime currentPerspectivesTimestamp =
      DateTime.fromMicrosecondsSinceEpoch(0);

  @observable
  String theUsersUID = '';

  final GetCurrentPerspectives logic;
  _GetCurrentPerspectivesStoreBase({required this.logic});

  @observable
  BaseFutureStore<CurrentPerspectivesEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.currentPerspectivesEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.currentPerspectivesEntity),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (perspectivesEntity) {
      currentPerspectives =
          ObservableList.of(perspectivesEntity.currentPerspectives);
      theUsersUID = perspectivesEntity.theUsersUID;
      currentPerspectivesTimestamp =
          perspectivesEntity.currentPerspectiveTimestamp;
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
