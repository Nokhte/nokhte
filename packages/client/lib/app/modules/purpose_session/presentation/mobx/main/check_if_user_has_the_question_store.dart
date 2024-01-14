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
    extends BaseMobxDBStore<NoParams, WhoHasTheQuestionEntity> with Store {
  @observable
  bool hasTheQuestion = false;

  final CheckIfUserHasTheQuestion logic;
  _CheckIfUserHasTheQuestionStoreBase({required this.logic});

  @observable
  BaseFutureStore<WhoHasTheQuestionEntity> futureStore = BaseFutureStore(
    baseEntity: Right(WhoHasTheQuestionEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(WhoHasTheQuestionEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (questionEntity) {
      hasTheQuestion = questionEntity.isTrue;
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
