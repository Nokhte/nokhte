// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';
part 'add_name_to_database_store.g.dart';

class AddNameToDatabaseStore = _AddNameToDatabaseStoreBase
    with _$AddNameToDatabaseStore;

abstract class _AddNameToDatabaseStoreBase
    extends BaseMobxDBStore<NoParams, NameCreationStatusEntity> with Store {
  final AddNameToDatabase logic;

  _AddNameToDatabaseStoreBase({required this.logic});

  NameCreationStatusEntity nameCreationStatus = const NameCreationStatusEntity(
    isSent: false,
  );

  @observable
  BaseFutureStore<NameCreationStatusEntity> futureStore = BaseFutureStore(
    baseEntity: NameCreationStatusEntity.initial,
    entityFutureParam: ObservableFuture(
      Future.value(NameCreationStatusEntity.initial),
    ),
  );

  @override
  void stateOrErrorUpdater(Either<Failure, NameCreationStatusEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (nameStatusEntity) {
        nameCreationStatus = nameStatusEntity;
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
