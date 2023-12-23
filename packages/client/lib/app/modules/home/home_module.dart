import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
      ];
  @override
  binds(i) {
    i.addSingleton<HomeRemoteSourceImpl>(
      () => HomeRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.addSingleton<HomeContractImpl>(
      () => HomeContractImpl(
        remoteSource: i<HomeRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.addSingleton<AddNameToDatabase>(
      () => AddNameToDatabase(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.addSingleton<GetCollaboratorPhrase>(
      () => GetCollaboratorPhrase(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.addSingleton<GetExistingCollaborationsInfo>(
      () => GetExistingCollaborationsInfo(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.addSingleton<GetExistingCollaborationsInfoStore>(
      () => GetExistingCollaborationsInfoStore(
        logic: i<GetExistingCollaborationsInfo>(),
      ),
    );
    i.addSingleton<AddNameToDatabaseStore>(
      () => AddNameToDatabaseStore(
        logic: i<AddNameToDatabase>(),
      ),
    );
    i.addSingleton<GetCollaboratorPhraseStore>(
      () => GetCollaboratorPhraseStore(
        logic: i<GetCollaboratorPhrase>(),
      ),
    );
    i.addSingleton<HomeScreenCoordinator>(
      () => HomeScreenCoordinator(
        widgets: Modular.get<HomeScreenWidgetsCoordinator>(),
        getExistingCollaborationInfo: i<GetExistingCollaborationsInfoStore>(),
        addNameToDatabaseStore: i<AddNameToDatabaseStore>(),
        getCollaboratorPhraseStore: i<GetCollaboratorPhraseStore>(),
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
