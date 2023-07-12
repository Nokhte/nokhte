// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/modules/deprecated/username/presentation/mobx/getters/get_default_username_getter_store.dart';
// * Constants
import 'package:primala/app/core/constants/entities.dart';
// * Future Store
import 'package:primala/app/core/mobx/base_future_store.dart';
// * Mobx Codegen Inclusion
part 'get_default_username_store.g.dart';

class GetDefaultUsernameStore = _GetDefaultUsernameStoreBase
    with _$GetDefaultUsernameStore;

abstract class _GetDefaultUsernameStoreBase
    extends BaseMobxDBStore<NoParams, DefaultUsernameEntity> with Store {
  final GetDefaultUsernameGetterStore getDefaultUsernameGetterStore;

  @observable
  BaseFutureStore<DefaultUsernameEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultUsernameEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultUsernameEntity,
      ),
    ),
  );

  _GetDefaultUsernameStoreBase({
    required this.getDefaultUsernameGetterStore,
  });

  @observable
  String defaultUsername = "";

  // Ok what are the
  @override
  void stateOrErrorUpdater(Either<Failure, DefaultUsernameEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (defaultUsernameEntity) {
        defaultUsername = defaultUsernameEntity.defaultUsername;
      },
    );
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    futureStore.entityOrFailureFuture = ObservableFuture(
      getDefaultUsernameGetterStore(),
    );
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
  }
}
