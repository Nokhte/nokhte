// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/domain/logic/create_username.dart';
import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/create_username_getter_store.dart';
// * Future Store
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Mobx Codegen Inclusion
part 'create_username_store.g.dart';

class CreateUsernameStore = _CreateUsernameStoreBase with _$CreateUsernameStore;

abstract class _CreateUsernameStoreBase
    extends BaseMobxDBStore<CreateUserParams, UsernameStatusEntity> with Store {
  final CreateUsernameGetterStore createUsernameGetterStore;

  @observable
  BaseFutureStore<UsernameStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.usernameStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.usernameStatusEntity,
      ),
    ),
  );

  _CreateUsernameStoreBase({required this.createUsernameGetterStore});

  @observable
  bool usernameIsCreated = false;

  @override
  void stateOrErrorUpdater(Either<Failure, UsernameStatusEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (usernameStatusEntity) {
        if (usernameStatusEntity.isCreated == true) {
          usernameIsCreated = true;
        }
      },
    );
  }

  @override
  @action
  Future<void> call(CreateUserParams params) async {
    futureStore.entityOrFailureFuture = ObservableFuture(
      createUsernameGetterStore.call(params.username),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    StoreState.loaded;
  }

  @override
  List<Object> get props => [errorMessage, state];
}
