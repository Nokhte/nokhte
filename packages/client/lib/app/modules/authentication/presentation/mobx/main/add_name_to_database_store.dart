/// add_name_to_database_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AddNameToDatabaseStore] class, which is a main store
/// responsible for handling the logic related to adding a name to the database
/// during the authentication process. The [AddNameToDatabaseStore] extends
/// [_AddNameToDatabaseStoreBase], which in turn extends [BaseMobxDBStore].
/// The store interacts with the UI layer and makes use of the
/// [AddNameToDatabaseGetterStore].
///
/// The [AddNameToDatabaseStore] manages the state of the name creation process,
/// including loading state,  error messages, and the resulting
/// [NameCreationStatusEntity] when te process is completed. It contains an
/// observable [nameCreationStatus] variable to store the satus of name
/// creation,  and a [futureStore] variable to handle the asynchronous call to
/// add the name to the database.
///
/// The [AddNameToDatabaseStore] implements the [BaseMobxDBStore] interface,
/// providing the necessary methods and properties for handling database
/// operations. It overrides the [call] method to trigger the name creation
/// process. When the [call] method is invoked, it sets the state to
/// [StoreState.loading], and initiates the asynchronous database operation
///  using the [addNameGetterStore] function from the
/// [AddNameToDatabaseGetterStore]. The result of the database operation
/// is wrapped in an [ObservableFuture], and the [stateOrErrorUpdater] method is
/// called to update the state based on the operation's result. Upon completion,
/// the state is set to [StoreState.loaded].
///
/// The [AddNameToDatabaseStore] uses the [_computeStoreState] method to compute
/// the current store state, based on the status of the [entityOrFailureFuture].
/// The [entityOrFailureFuture] holds an [Either] type, representing either a
/// successful result or a [Failure] in case of an error.
///
/// The store also provides a [mapFailureToMessage] method to map different
/// [Failure] types to corresponding error messages, which are displayed in case
/// of a failure.
///
/// Note: The ignore_for_file directive is used to suppress warnings about library_private_types_in_public_api
/// and must_be_immutable.

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_future_store.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/add_name_to_database_getter_store.dart';
part 'add_name_to_database_store.g.dart';

/// [AddNameToDatabaseStore] is a main store that manages the logic for adding a name to the database
/// during the authentication process.
class AddNameToDatabaseStore = _AddNameToDatabaseStoreBase
    with _$AddNameToDatabaseStore;

/// [_AddNameToDatabaseStoreBase] extends [BaseMobxDBStore] and handles the asynchronous
/// database operations for adding a name to the database.
abstract class _AddNameToDatabaseStoreBase
    extends BaseMobxDBStore<NoParams, NameCreationStatusEntity> with Store {
  final AddNameToDatabaseGetterStore addNameGetterStore;

  _AddNameToDatabaseStoreBase({required this.addNameGetterStore});

  /// [nameCreationStatus] holds the current status of the name creation process.
  NameCreationStatusEntity nameCreationStatus = const NameCreationStatusEntity(
    isSent: false,
  );

  /// [futureStore] is a BaseFutureStore that handles the asynchronous database operation
  /// to add the name to the database.
  @observable
  BaseFutureStore<NameCreationStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.nameCreationStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(DefaultEntities.nameCreationStatusEntity),
    ),
  );

  /// [stateOrErrorUpdater] is a method that updates the store state and the [nameCreationStatus]
  /// based on the result of the database operation, which is wrapped in an [Either] type.
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

  /// [call] is the method responsible for initiating the name creation process. It sets the store state
  /// to [StoreState.loading], and invokes the [addNameGetterStore] function to perform the asynchronous
  /// database operation. The result is then unwrapped from the [ObservableFuture], and the [stateOrErrorUpdater]
  /// method is called to update the state based on the result. Finally, the store state is set to [StoreState.loaded].
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
