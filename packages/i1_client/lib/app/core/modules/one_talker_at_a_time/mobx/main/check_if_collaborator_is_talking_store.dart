// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';
part 'check_if_collaborator_is_talking_store.g.dart';

class CheckIfCollaboratorIsTalkingStore = _CheckIfCollaboratorIsTalkingStoreBase
    with _$CheckIfCollaboratorIsTalkingStore;

abstract class _CheckIfCollaboratorIsTalkingStoreBase
    extends BaseMobxDBStore<NoParams, CollaborativeDocCollaboratorInfoEntity>
    with Store {
  final CheckIfCollaboratorIsTalking logic;

  @observable
  ObservableStream<bool> collaboratorIsTalking =
      ObservableStream(Stream.value(false));

  _CheckIfCollaboratorIsTalkingStoreBase({
    required this.logic,
  });

  @override
  Future<void> call(params) async {
    final result = await logic(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (collaboratorTalkingEntity) {
        collaboratorIsTalking = ObservableStream(
          collaboratorTalkingEntity.collaboratorIsTalking,
        );
        state = StoreState.loaded;
      },
    );
  }
}
