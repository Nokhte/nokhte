// ignore_for_file: must_be_immutable, library_private_types_in_public_api, type_literal_in_constant_pattern
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
// * Mobx Codegen Inclusion
part 'base_mobx_db_store.g.dart';

class BaseMobxDBStore<Params, T> = _BaseMobxDBStoreBase<Params, T>
    with _$BaseMobxDBStore;

abstract class _BaseMobxDBStoreBase<Params, T> extends Equatable with Store {
  @observable
  StoreState state = StoreState.initial;

  @observable
  String errorMessage = "";

  // Ok what are the
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkConnectionFailure:
        return FailureConstants.internetConnectionFailureMsg;
      default:
        return FailureConstants.genericFailureMsg;
    }
  }

  void stateOrErrorUpdater(Either<Failure, T> result) {}

  @action
  Future<void> call(Params params) async {}

  @override
  List<Object> get props => [
// some items
      ];
}
