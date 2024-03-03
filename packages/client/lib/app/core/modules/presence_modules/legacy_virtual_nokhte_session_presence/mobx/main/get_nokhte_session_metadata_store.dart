// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/types/types.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'get_nokhte_session_metadata_store.g.dart';

class GetNokhteSessionMetadataStore = _GetNokhteSessionMetadataStoreBase
    with _$GetNokhteSessionMetadataStore;

abstract class _GetNokhteSessionMetadataStoreBase
    extends BaseGetSessionMetadataStore<NokhteSessionMetadata> with Store {
  _GetNokhteSessionMetadataStoreBase({required super.logic});

  @computed
  bool get isAllowedToExit => userWantsToExit && collaboratorWantsToExit;

  @computed
  bool get userWantsToExit => userPhase == 2.0;

  @computed
  bool get collaboratorWantsToExit => collaboratorPhase == 2.0;

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
