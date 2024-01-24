import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/collaborator_presence_incidents_overlay/stack/presentation/presentation.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CollaboratorPresenceIncidentsOverlay extends StatelessWidget {
  final CollaboratorPresenceIncidentsOverlayStore store;
  const CollaboratorPresenceIncidentsOverlay({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Stack(
          children: [
            FullScreen(
              child: NokhteBlur(
                store: store.blur,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Center(
                child: AnimatedOpacity(
                  opacity: useWidgetOpacity(store.showWidget),
                  duration: Seconds.get(1),
                  child: const Jost(
                    "Collaborator Is Offline",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
