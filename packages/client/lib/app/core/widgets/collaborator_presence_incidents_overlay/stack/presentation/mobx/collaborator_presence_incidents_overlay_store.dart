// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaborator_presence_incidents_overlay_store.g.dart';

class CollaboratorPresenceIncidentsOverlayStore = _CollaboratorPresenceIncidentsOverlayStoreBase
    with _$CollaboratorPresenceIncidentsOverlayStore;

abstract class _CollaboratorPresenceIncidentsOverlayStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  final GetSessionMetadataStore sessionMetadataStore;
  final NokhteBlurStore blur;

  _CollaboratorPresenceIncidentsOverlayStoreBase({
    required this.sessionMetadataStore,
    required this.blur,
  }) {
    setWidgetVisibility(false);
  }

  @action
  onCollaboratorLeft() {
    blur.init();
    setWidgetVisibility(true);
  }

  @action
  onCollaboratorJoined() {
    blur.reverse();
    setWidgetVisibility(false);
  }

  collaboratorPresenceReactor(Function onJoined, Function onLeft) =>
      reaction((p0) => sessionMetadataStore.collaboratorIsOnline, (p0) {
        if (p0) {
          onCollaboratorJoined();
          onJoined();
        } else {
          onCollaboratorLeft();
          onLeft();
        }
      });
}
