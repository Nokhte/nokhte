import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'collaboration_widgets_module.dart';

class CollaborationModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationWidgetsModule(),
        UserInformationModule(),
        GesturesModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
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

    i.add<CancelCollaboratorSearchStream>(
      () => CancelCollaboratorSearchStream(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<EnterCollaboratorPool>(
      () => EnterCollaboratorPool(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<ExitCollaboratorPool>(
      () => ExitCollaboratorPool(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<GetCollaboratorSearchStatus>(
      () => GetCollaboratorSearchStatus(
        contract: i<CollaborationContractImpl>(),
      ),
    );

    i.add<CancelCollaboratorSearchStreamStore>(
      () => CancelCollaboratorSearchStreamStore(
          logic: i<CancelCollaboratorSearchStream>()),
    );
    i.add<EnterCollaboratorPoolStore>(
      () => EnterCollaboratorPoolStore(
        logic: i<EnterCollaboratorPool>(),
      ),
    );
    i.add<ExitCollaboratorPoolStore>(
      () => ExitCollaboratorPoolStore(
        logic: i<ExitCollaboratorPool>(),
      ),
    );
    i.add<GetCollaboratorSearchStatusStore>(
      () => GetCollaboratorSearchStatusStore(
        logic: i<GetCollaboratorSearchStatus>(),
      ),
    );

    i.add<CollaborationHomeScreenCoordinator>(
      () => CollaborationHomeScreenCoordinator(
        enterCollaboratorPool: i<EnterCollaboratorPoolStore>(),
        swipe: Modular.get<SwipeDetector>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<CollaborationHomeScreenWidgetsCoordinator>(),
        userInformation: i<UserInformationCoordinator>(),
      ),
    );
    i.add<CollaboratorPoolScreenCoordinator>(
      () => CollaboratorPoolScreenCoordinator(
        cancelCollaboratorSearchStream:
            i<CancelCollaboratorSearchStreamStore>(),
        exitCollaboratorPool: i<ExitCollaboratorPoolStore>(),
        getCollaboratorSearchStatus: i<GetCollaboratorSearchStatusStore>(),
        widgets: Modular.get<CollaboratorPoolScreenWidgetsCoordinator>(),
      ),
    );
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
    r.child(
      '/pool',
      transition: TransitionType.noTransition,
      child: (context) => CollaboratorPoolScreen(
        coordinator: Modular.get<CollaboratorPoolScreenCoordinator>(),
      ),
    );
  }
}
