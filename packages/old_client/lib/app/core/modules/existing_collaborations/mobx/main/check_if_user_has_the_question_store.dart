// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';
part 'check_if_user_has_the_question_store.g.dart';

class CheckIfUserHasTheQuestionStore = _CheckIfUserHasTheQuestionStoreBase
    with _$CheckIfUserHasTheQuestionStore;

abstract class _CheckIfUserHasTheQuestionStoreBase
    extends BaseMobxDBStore<NoParams, WhoHasTheQuestionEntity> with Store {
  final CheckIfUserHasTheQuestion logic;

  _CheckIfUserHasTheQuestionStoreBase({
    required this.logic,
  });

  @observable
  BaseFutureStore<WhoHasTheQuestionEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.whoHasTheQuestionEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.whoHasTheQuestionEntity,
      ),
    ),
  );

  @observable
  bool hasTheQuestion = false;

  @override
  void stateOrErrorUpdater(result) {
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (questionEntity) {
        hasTheQuestion = questionEntity.isSent;
      },
    );
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
