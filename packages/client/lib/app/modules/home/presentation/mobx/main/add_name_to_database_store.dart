// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/home/domain/entities/name_creation_status_entity.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/getter/add_name_to_database_getter_store.dart';
part 'add_name_to_database_store.g.dart';

class AddNameToDatabaseStore = _AddNameToDatabaseStoreBase
    with _$AddNameToDatabaseStore;

abstract class _AddNameToDatabaseStoreBase
    extends BaseMobxDBStore<NoParams, NameCreationStatusEntity> with Store {
  final AddNameToDatabaseGetterStore getterStore;

  _AddNameToDatabaseStoreBase({required this.getterStore});

  NameCreationStatusEntity nameCreationStatus = const NameCreationStatusEntity(
    isSent: false,
  );

  @observable
  BaseFutureStore<NameCreationStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.nameCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.nameCreationStatusEntity),
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
      getterStore(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
