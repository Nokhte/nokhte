// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'get_purpose_session_metadata_store.g.dart';

class GetPurposeSessionMetadataStore = _GetPurposeSessionMetadataStoreBase
    with _$GetPurposeSessionMetadataStore;

abstract class _GetPurposeSessionMetadataStoreBase
    extends BaseGetSessionMetadataStore<CollaborationSessionMetadata>
    with Store {
  _GetPurposeSessionMetadataStoreBase({required super.logic});

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
