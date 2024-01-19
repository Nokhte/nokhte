// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
part 'add_name_to_database_store.g.dart';

class AddNameToDatabaseStore = _AddNameToDatabaseStoreBase
    with _$AddNameToDatabaseStore;

abstract class _AddNameToDatabaseStoreBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  final AddNameToDatabase logic;

  _AddNameToDatabaseStoreBase({required this.logic});

  @observable
  bool nameIsAdded = false;

  @observable
  BaseFutureStore<bool> futureStore = BaseFutureStore(
    baseEntity: const Right(false),
    entityFutureParam: ObservableFuture(
      Future.value(const Right(false)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (nameAddStatus) {
        nameIsAdded = nameAddStatus;
      },
    );
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(
      logic(params),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
