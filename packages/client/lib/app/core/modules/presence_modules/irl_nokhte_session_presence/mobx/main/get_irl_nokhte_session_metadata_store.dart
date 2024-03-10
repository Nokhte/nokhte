// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';
part 'get_irl_nokhte_session_metadata_store.g.dart';

class GetIrlNokhteSessionMetadataStore = _GetIrlNokhteSessionMetadataStoreBase
    with _$GetIrlNokhteSessionMetadataStore;

abstract class _GetIrlNokhteSessionMetadataStoreBase
    extends BaseGetSessionMetadataStore<IrlNokhteSessionMetadata> with Store {
  _GetIrlNokhteSessionMetadataStoreBase({required super.logic});

  @computed
  bool get canMoveIntoInstructions => userPhase == 1 && collaboratorPhase == 1;

  @computed
  bool get canMoveIntoSession => userPhase == 2 && collaboratorPhase == 2;

  @computed
  bool get canMoveIntoSecondInstructionsSet =>
      userPhase == 1 && collaboratorPhase == 2;

  @action
  Future<void> get(params) async {
    final result = await logic(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        streamSubscription = sessionMetadata.listen((value) {
          userIsOnline = value.userIsOnline;
          userIsTalking = value.userIsTalking;
          collaboratorIsOnline = value.collaboratorIsOnline;
          collaboratorIsTalking = value.collaboratorIsTalking;
          userPhase = value.userPhase;
          collaboratorPhase = value.collaboratorPhase;
        });
        state = StoreState.loaded;
      },
    );
  }
}
