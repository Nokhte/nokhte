// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/domain/domain.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'irl_nokhte_session_presence_coordinator.g.dart';

class IrlNokhteSessionPresenceCoordinator = _IrlNokhteSessionPresenceCoordinatorBase
    with _$IrlNokhteSessionPresenceCoordinator;

abstract class _IrlNokhteSessionPresenceCoordinatorBase
    extends BasePresenceCoordinator with Store {
  final GetIrlNokhteSessionMetadataStore getSessionMetadataStore;
  final NokhteBlurStore blur;
  final CollaboratorPresenceIncidentsOverlayStore incidentsOverlayStore;
  final AddContent addContentLogic;
  final CompleteTheSession completeTheSessionLogic;

  _IrlNokhteSessionPresenceCoordinatorBase({
    required super.cancelSessionMetadataStreamLogic,
    required super.updateCurrentPhaseLogic,
    required super.updateOnlineStatusLogic,
    required this.getSessionMetadataStore,
    required this.addContentLogic,
    required this.completeTheSessionLogic,
    required this.blur,
  }) : incidentsOverlayStore = CollaboratorPresenceIncidentsOverlayStore(
          sessionMetadataStore: getSessionMetadataStore,
          blur: blur,
        );

  @observable
  bool contentIsUpdated = false;

  @observable
  bool sessionIsFinished = false;

  @override
  @action
  initReactors({
    required Function onCollaboratorJoined,
    required Function onCollaboratorLeft,
  }) {
    incidentsOverlayStore.collaboratorPresenceReactor(
        onCollaboratorJoined, onCollaboratorLeft);
  }

  @action
  dispose() async {
    state = StoreState.loading;
    final res = cancelSessionMetadataStreamLogic(NoParams());
    await getSessionMetadataStore.dispose();
    isListening = res;
  }

  @action
  listen() {
    state = StoreState.loading;
    getSessionMetadataStore.get(NoParams());
  }

  @action
  addContent(String params) async {
    final res = await addContentLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (contentUpdateStatus) => contentIsUpdated = contentUpdateStatus,
    );
  }

  @action
  completeTheSession() async {
    final res = await completeTheSessionLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (sessionUpdateStatus) => sessionIsFinished = sessionUpdateStatus,
    );
  }

  @action
  setBasePhaseForScreen(double updateCurrentPhaseLogic) =>
      getSessionMetadataStore.setCurrentPhase(updateCurrentPhaseLogic);
}
