// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:videosdk/videosdk.dart';
part 'voice_call_coordinator.g.dart';

class VoiceCallCoordinator = _VoiceCallCoordinatorBase
    with _$VoiceCallCoordinator;

abstract class _VoiceCallCoordinatorBase
    extends BaseMobxDBStore<NoParams, RoomInformationEntity> with Store {
  Room room = Room(
    displayName: 'Nokhte Collaboration',
    participantId: '',
    micEnabled: false,
    camEnabled: false,
    token: '',
    meetingId: '',
    maxResolution: '',
    multiStream: false,
    customCameraVideoTrack: null,
    customMicrophoneAudioTrack: null,
    notification: const NotificationInfo(title: '', message: '', icon: ''),
    mode: Mode.CONFERENCE,
    metaData: {},
  );

  @observable
  String token = '';
  @observable
  String meetingID = '';

  @observable
  bool hasJoinedCall = false;

  @observable
  bool collaboratorHasJoined = false;

  final GetRoomInformation logic;
  _VoiceCallCoordinatorBase({required this.logic});

  initReactors() {
    room.on(Events.roomJoined, () {
      hasJoinedCall = true;
    });

    room.on(Events.roomLeft, () {
      hasJoinedCall = false;
    });

    room.on(Events.participantJoined, () {
      collaboratorHasJoined = true;
    });

    room.on(Events.participantLeft, () {
      collaboratorHasJoined = false;
    });
  }

  @observable
  BaseFutureStore<RoomInformationEntity> futureStore = BaseFutureStore(
    baseEntity: Right(RoomInformationEntity.initial()),
    entityFutureParam: ObservableFuture(
      Future.value(Right(RoomInformationEntity.initial())),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (roomInformationEntity) {
      print("roomInformationEntity: $roomInformationEntity");
      room = VideoSDK.createRoom(
          token: roomInformationEntity.token,
          roomId: roomInformationEntity.meetingId,
          micEnabled: false,
          camEnabled: false,
          displayName: 'Nokhte Collaboration',
          participantId: roomInformationEntity.userUID);

      initReactors();
    });
  }

  @action
  joinCall() async => await room.join();

  @action
  leaveCall() => room.leave();

  @action
  mute() async => await room.muteMic();

  @action
  unmute() async => await room.unmuteMic();

  @action
  Future<void> getRoomInformation(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
