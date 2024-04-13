// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
part 'collaborator_presence_incidents_overlay_store.g.dart';

class CollaboratorPresenceIncidentsOverlayStore = _CollaboratorPresenceIncidentsOverlayStoreBase
    with _$CollaboratorPresenceIncidentsOverlayStore;

abstract class _CollaboratorPresenceIncidentsOverlayStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  final BaseGetSessionMetadataStore sessionMetadataStore;

  _CollaboratorPresenceIncidentsOverlayStoreBase({
    required this.sessionMetadataStore,
  }) {
    setWidgetVisibility(false);
  }

  @action
  onCollaboratorLeft() {
    setWidgetVisibility(true);
  }

  @action
  onCollaboratorJoined() {
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
