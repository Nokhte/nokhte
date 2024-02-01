// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
part 'get_session_metadata_store.g.dart';

class GetSessionMetadataStore = _GetSessionMetadataStoreBase
    with _$GetSessionMetadataStore;

abstract class _GetSessionMetadataStoreBase
    extends BaseGetSessionMetadataStore<CollaborationSessionMetadata>
    with Store {
  _GetSessionMetadataStoreBase({required super.logic});

  @observable
  bool timerShouldRun = false;

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
          timerShouldRun = value.timerShouldRun;
          collaboratorIsTalking = value.collaboratorIsTalking;
          userPhase = value.userPhase;
          collaboratorPhase = value.collaboratorPhase;
        });
        state = StoreState.loaded;
      },
    );
  }
}
