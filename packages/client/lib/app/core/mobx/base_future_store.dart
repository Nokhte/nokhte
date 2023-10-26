// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/error/failure.dart';
// * Core StoreState Type
import './store_state.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'base_future_store.g.dart';

// Here's the thing all of our types will be Either<Failure, Entity>

class BaseFutureStore<T> = _BaseFutureStoreBase<T> with _$BaseFutureStore;

abstract class _BaseFutureStoreBase<T> extends Equatable with Store {
  @observable
  late ObservableFuture<Either<Failure, T>> entityOrFailureFuture;

  @observable
  late Either<Failure, T> unwrappedEntityOrFailure;

  _BaseFutureStoreBase({
    required Either<Failure, T> baseEntity,
    required ObservableFuture<Either<Failure, T>> entityFutureParam,
  })  : unwrappedEntityOrFailure = baseEntity,
        entityOrFailureFuture = entityFutureParam;

  @computed
  StoreState get storeState => _computeStoreState(entityOrFailureFuture);

  _computeStoreState(ObservableFuture observable) {
    if (observable.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return entityOrFailureFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @override
  List<Object> get props => [
        entityOrFailureFuture,
        unwrappedEntityOrFailure,
      ];
}
// TODO Test this later

// So this is our thesis on how the mobX store should work,

// So the tentative plan is to set the future store to the async call of the getter store
// Note in the example above when they are actually doing the logic in the main store
// here's the under the pipes for our sakes, first you will want to do await in the return
// statement of the getter in our case this will be the getter store call method 
// so make sure you have the await there, and what you will do is set the future
// in the main class to this one, so you will have to instantiate the future Store
// inline so do you have a clearer picture?

// ok so our goal now is to 