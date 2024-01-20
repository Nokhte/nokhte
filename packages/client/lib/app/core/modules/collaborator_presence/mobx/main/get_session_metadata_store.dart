// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
part 'get_session_metadata_store.g.dart';

class GetSessionMetadataStore = _GetSessionMetadataStoreBase
    with _$GetSessionMetadataStore;

abstract class _GetSessionMetadataStoreBase
    extends BaseMobxDBStore<NoParams, Stream<CollaborationSessionMetadata>>
    with Store {
  final GetSessionMetadata logic;
  _GetSessionMetadataStoreBase({required this.logic});

  @observable
  int userPhase = 0;

  @observable
  int collaboratorPhase = 0;

  @observable
  bool userIsOnCall = false;

  @observable
  bool collaboratorIsOnCall = false;

  @observable
  bool userIsOnline = false;

  @observable
  bool collaboratorIsOnline = false;

  @observable
  bool timerShouldRun = false;

  @observable
  bool collaboratorIsTalking = false;

  @computed
  bool get bothCollaboratorsAreOnCallAndOnline =>
      userIsOnCall &&
      collaboratorIsOnCall &&
      userIsOnline &&
      collaboratorIsOnline;

  @computed
  bool get collaboratorHasMovedOn => collaboratorPhase == 2;

  @observable
  ObservableStream<CollaborationSessionMetadata> sessionMetadata =
      ObservableStream(const Stream.empty());

  @override
  @action
  Future<void> call(params) async {
    final result = await logic(params);
    result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      },
      (stream) {
        sessionMetadata = ObservableStream(stream);
        sessionMetadata.listen((value) {
          userIsOnCall = value.userIsOnCall;
          collaboratorIsOnCall = value.collaboratorIsOnCall;
          userIsOnline = value.userIsOnline;
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
