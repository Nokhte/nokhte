import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/modules/p2p_collaborator_session/presentation/views/p2p_collaborator_session_screen.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const P2PCollaboratorSessionScreen(),
        ),
      ];
}
