// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_future_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseFutureStore<T> on _BaseFutureStoreBase<T>, Store {
  Computed<StoreState>? _$storeStateComputed;

  @override
  StoreState get storeState =>
      (_$storeStateComputed ??= Computed<StoreState>(() => super.storeState,
              name: '_BaseFutureStoreBase.storeState'))
          .value;

  late final _$entityOrFailureFutureAtom = Atom(
      name: '_BaseFutureStoreBase.entityOrFailureFuture', context: context);

  @override
  ObservableFuture<Either<Failure, T>> get entityOrFailureFuture {
    _$entityOrFailureFutureAtom.reportRead();
    return super.entityOrFailureFuture;
  }

  @override
  set entityOrFailureFuture(ObservableFuture<Either<Failure, T>> value) {
    _$entityOrFailureFutureAtom.reportWrite(value, super.entityOrFailureFuture,
        () {
      super.entityOrFailureFuture = value;
    });
  }

  late final _$unwrappedEntityOrFailureAtom = Atom(
      name: '_BaseFutureStoreBase.unwrappedEntityOrFailure', context: context);

  @override
  Either<Failure, T> get unwrappedEntityOrFailure {
    _$unwrappedEntityOrFailureAtom.reportRead();
    return super.unwrappedEntityOrFailure;
  }

  @override
  set unwrappedEntityOrFailure(Either<Failure, T> value) {
    _$unwrappedEntityOrFailureAtom
        .reportWrite(value, super.unwrappedEntityOrFailure, () {
      super.unwrappedEntityOrFailure = value;
    });
  }

  @override
  String toString() {
    return '''
entityOrFailureFuture: ${entityOrFailureFuture},
unwrappedEntityOrFailure: ${unwrappedEntityOrFailure},
storeState: ${storeState}
    ''';
  }
}
