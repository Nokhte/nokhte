// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/error/failure.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/add_name_to_database_getter_store.dart';
// * Mobx Codegen Inclusion
part 'add_name_to_database_store.g.dart';

class AddNameToDatabaseStore = _AddNameToDatabaseStoreBase
    with _$AddNameToDatabaseStore;

abstract class _AddNameToDatabaseStoreBase
    extends BaseMobxDBStore<NoParams, NameCreationStatusEntity> with Store {
  final AddNameToDatabaseGetterStore addNameGetterStore;

  _AddNameToDatabaseStoreBase({required this.addNameGetterStore});

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
      addNameGetterStore(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [];
}
