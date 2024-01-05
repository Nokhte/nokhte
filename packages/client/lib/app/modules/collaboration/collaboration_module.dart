import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'collaboration_widgets_module.dart';
import 'domain/domain.dart';

class CollaborationModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationWidgetsModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<CollaborationRemoteSourceImpl>(
      () => CollaborationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<CollaborationContractImpl>(
      () => CollaborationContractImpl(
        remoteSource: i<CollaborationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.addSingleton<GetInvitationURL>(
      () => GetInvitationURL(
        contract: i<CollaborationContractImpl>(),
      ),
    );

    i.addSingleton<ShareCollaborationInvitation>(
      () => ShareCollaborationInvitation(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.addSingleton<GetInvitationURLStore>(
      () => GetInvitationURLStore(
        logic: i<GetInvitationURL>(),
      ),
    );
    i.addSingleton<ShareCollaborationInvitationStore>(
      () => ShareCollaborationInvitationStore(
        logic: i<ShareCollaborationInvitation>(),
      ),
    );
    i.add<CollaborationHomeScreenCoordinator>(
      () => CollaborationHomeScreenCoordinator(
        getInvitationURL: i<GetInvitationURLStore>(),
        shareCollaborationInvitation: i<ShareCollaborationInvitationStore>(),
        widgets: Modular.get<CollaborationHomeScreenWidgetsCoordinator>(),
      ),
    );
    //
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => CollaborationHomeScreen(
        coordinator: Modular.get<CollaborationHomeScreenCoordinator>(),
      ),
    );
    //
  }
}
