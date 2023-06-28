// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/check_if_username_is_created_getter_store.dart';
import 'package:primala/app/core/constants/entities.dart';
// * Future Store
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Mobx Codegen Inclusion
part 'check_if_username_is_created_store.g.dart';

class CheckIfUsernameIsCreatedStore = _CheckIfUsernameIsCreatedStoreBase
    with _$CheckIfUsernameIsCreatedStore;

abstract class _CheckIfUsernameIsCreatedStoreBase
    extends BaseMobxDBStore<NoParams, UsernameStatusEntity> with Store {
  final CheckIfUsernameIsCreatedGetterStore checkUsernameGetterStore;

  @observable
  BaseFutureStore<UsernameStatusEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.usernameStatusEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.usernameStatusEntity,
      ),
    ),
  );

  _CheckIfUsernameIsCreatedStoreBase({required this.checkUsernameGetterStore});

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
  Future<void> call(NoParams params) async {
    futureStore.entityOrFailureFuture = ObservableFuture(
      checkUsernameGetterStore.call(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }

  @override
  List<Object> get props => [
// some items
      ];
}
