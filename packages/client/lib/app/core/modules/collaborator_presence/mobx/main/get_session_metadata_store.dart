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

  @observable
  String meetingToken = '';

  @observable
  String meetingId = '';

  @computed
  bool get bothCollaboratorsAreOnCallAndOnline =>
      userIsOnCall &&
      collaboratorIsOnCall &&
      userIsOnline &&
      collaboratorIsOnline;

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
        sessionMetadata.distinct().listen((value) {
          userIsOnCall = value.userIsOnCall;
          collaboratorIsOnCall = value.collaboratorIsOnCall;
          userIsOnline = value.userIsOnline;
          collaboratorIsOnline = value.collaboratorIsOnline;
          timerShouldRun = value.timerShouldRun;
          collaboratorIsTalking = value.collaboratorIsTalking;
          meetingId = value.meetingId;
          meetingToken = value.meetingToken;
        });
        state = StoreState.loaded;
      },
    );
  }
}
