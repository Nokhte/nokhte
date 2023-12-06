// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:equatable/equatable.dart';
part 'agora_callbacks_store.g.dart';

class AgoraCallbacksStore = _AgoraCallbacksStoreBase with _$AgoraCallbacksStore;

abstract class _AgoraCallbacksStoreBase extends Equatable with Store {
  @observable
  CallStatus inCall = CallStatus.initial;

  @observable
  bool hasCollaboratorJoined = false;

  @action
  onCallJoined() {
    inCall = CallStatus.joined;
  }

  @action
  collaboratorHasJoined() {
    hasCollaboratorJoined = true;
  }

  @action
  collaboratorHasLeft() {
    hasCollaboratorJoined = false;
  }

  @action
  onCallLeft() {
    inCall = CallStatus.left;
  }

  @override
  List<Object> get props => [];
}
