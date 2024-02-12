// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'voice_call_incidents_overlay_store.g.dart';

class VoiceCallIncidentsOverlayStore = _VoiceCallIncidentsOverlayStoreBase
    with _$VoiceCallIncidentsOverlayStore;

abstract class _VoiceCallIncidentsOverlayStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  final VoiceCallStatusStore voiceCallStatusStore;
  final NokhteBlurStore blur;

  _VoiceCallIncidentsOverlayStoreBase({
    required this.voiceCallStatusStore,
    required this.blur,
  });

  @observable
  bool showJoiningCall = false;

  @action
  setShowJoiningCall(bool newVal) => showJoiningCall = newVal;

  @observable
  bool showWaitingOnCollaborator = false;

  @action
  setShowWaitingOnCollaborator(bool newVal) =>
      showWaitingOnCollaborator = newVal;

  @action
  constructor() {
    blur.init();
    setShowJoiningCall(true);
  }
}
