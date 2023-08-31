// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/types/types.dart';
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'agora_callbacks_store.g.dart';

class AgoraCallbacksStore = _AgoraCallbacksStoreBase with _$AgoraCallbacksStore;

abstract class _AgoraCallbacksStoreBase extends Equatable with Store {
  @observable
  CallStatus inCall = CallStatus.theDefault;

  @action
  onCallJoined() {
    inCall = CallStatus.joined;
  }

  @action
  onCallLeft() {
    inCall = CallStatus.left;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
