// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/entities.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_future_store.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'check_if_user_has_the_question_store.g.dart';

class CheckIfUserHasTheQuestionStore = _CheckIfUserHasTheQuestionStoreBase
    with _$CheckIfUserHasTheQuestionStore;

abstract class _CheckIfUserHasTheQuestionStoreBase
    extends BaseMobxDBStore<NoParams, WhoGetsTheQuestionEntity> with Store {
  final CheckIfUserHasTheQuestionGetterStore getterStore;

  _CheckIfUserHasTheQuestionStoreBase({
    required this.getterStore,
  });

  @observable
  BaseFutureStore<WhoGetsTheQuestionEntity> futureStore = BaseFutureStore(
    baseEntity: DefaultEntities.defaultWhoGetsQuestionEntity,
    entityFutureParam: ObservableFuture(
      Future.value(
        DefaultEntities.defaultWhoGetsQuestionEntity,
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
        hasTheQuestion = questionEntity.hasIt;
      },
    );
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(getterStore());
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
