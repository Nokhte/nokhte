// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';
part 'check_if_user_has_the_question_store.g.dart';

class CheckIfUserHasTheQuestionStore = _CheckIfUserHasTheQuestionStoreBase
    with _$CheckIfUserHasTheQuestionStore;

abstract class _CheckIfUserHasTheQuestionStoreBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  @observable
  bool hasTheQuestion = false;

  final CheckIfUserHasTheQuestion logic;
  _CheckIfUserHasTheQuestionStoreBase({required this.logic});

  @observable
  BaseFutureStore<bool> futureStore = BaseFutureStore(
    baseEntity: const Right(false),
    entityFutureParam: ObservableFuture(
      Future.value(const Right(false)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (hasTheQuestionRes) {
      hasTheQuestion = hasTheQuestionRes;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
