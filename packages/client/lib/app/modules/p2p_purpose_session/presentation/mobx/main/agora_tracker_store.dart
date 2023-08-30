// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:equatable/equatable.dart';
part 'agora_tracker_store.g.dart';

class AgoraTrackerStore = _AgoraTrackerStoreBase with _$AgoraTrackerStore;

abstract class _AgoraTrackerStoreBase extends Equatable with Store {
  @observable
  CallStatus inCall = CallStatus.out;

  @action
  joiningCall() {
    inCall = CallStatus.joined;
  }

  @action
  leavingCall() {
    inCall = CallStatus.left;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
