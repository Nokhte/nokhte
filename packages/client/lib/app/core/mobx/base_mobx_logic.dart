import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/error/failure.dart';

import 'store_state.dart';

mixin BaseMobxLogic<T> on Store {
  @observable
  StoreState state = StoreState.initial;

  @observable
  String errorMessage = "";

  @action
  setErrorMessage(String msg) => errorMessage = msg;

  String baseMapFailureToMessage(Failure failure) {
    if (failure.runtimeType == NetworkConnectionFailure) {
      return FailureConstants.internetConnectionFailureMsg;
    } else {
      return FailureConstants.genericFailureMsg;
    }
  }

  @action
  baseErrorUpdater(Failure failure) {
    errorMessage = baseMapFailureToMessage(failure);
    state = StoreState.initial;
  }

  void stateOrErrorUpdater(Either<Failure, T> result) {}
}
