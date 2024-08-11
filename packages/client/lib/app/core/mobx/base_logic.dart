// ignore_for_file: must_be_immutable, library_private_types_in_public_api, type_literal_in_constant_pattern
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';

mixin BaseMobxLogic<Params, T> {
  final _state = Observable(StoreState.initial);

  StoreState get state => _state.value;

  final _errorMessage = Observable("");

  String get errorMessage => _errorMessage.value;

  Action actionSetErrorMessage = Action(() {});
  Action actionSetState = Action(() {});

  _setErrorMessage(String msg) => _errorMessage.value = msg;

  _setState(StoreState state) => _state.value = state;

  setErrorMessage(String msg) {
    actionSetErrorMessage.call([msg]);
  }

  setState(StoreState state) {
    actionSetState.call([state]);
  }

  initBaseLogicActions() {
    actionSetErrorMessage = Action(_setErrorMessage);
    actionSetState = Action(_setState);
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkConnectionFailure:
        return FailureConstants.internetConnectionFailureMsg;
      default:
        return FailureConstants.genericFailureMsg;
    }
  }

  errorUpdater(Failure failure) {
    setErrorMessage(mapFailureToMessage(failure));
    setState(StoreState.initial);
  }

  void stateOrErrorUpdater(Either<Failure, T> result) {}

  @action
  Future<void> call(Params params) async {}
}
