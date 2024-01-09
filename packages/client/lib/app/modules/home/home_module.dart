import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
        GesturesModule(),
        UserInformationModule(),
        DeepLinksModule(),
      ];
  @override
  binds(i) {
    i.add<HomeRemoteSourceImpl>(
      () => HomeRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<HomeContractImpl>(
      () => HomeContractImpl(
        remoteSource: i<HomeRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<AddNameToDatabase>(
      () => AddNameToDatabase(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.add<GetExistingCollaborationsInfo>(
      () => GetExistingCollaborationsInfo(
        contract: i<HomeContractImpl>(),
      ),
    );

    i.add<AddNameToDatabaseStore>(
      () => AddNameToDatabaseStore(
        logic: i<AddNameToDatabase>(),
      ),
    );
    i.add<GetExistingCollaborationsInfoStore>(
      () => GetExistingCollaborationsInfoStore(
        logic: i<GetExistingCollaborationsInfo>(),
      ),
    );

    i.add<HomeScreenCoordinator>(
      () => HomeScreenCoordinator(
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        addNameToDatabaseStore: i<AddNameToDatabaseStore>(),
        getExistingCollaborationInfo: i<GetExistingCollaborationsInfoStore>(),
        widgets: Modular.get<HomeScreenWidgetsCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreen(
        coordinator: Modular.get<HomeScreenCoordinator>(),
      ),
    );
  }
}
