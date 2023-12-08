import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widget_modules/beach_waves_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        GesturesModule(),
      ];
  @override
  binds(i) => [
        i.addSingleton<HomeRemoteSourceImpl>(
          () => HomeRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        i.addSingleton<HomeContractImpl>(
          () => HomeContractImpl(
            remoteSource: i<HomeRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        i.addSingleton<AddNameToDatabase>(
          () => AddNameToDatabase(
            contract: i<HomeContract>(),
          ),
        ),
        i.addSingleton<GetCollaboratorPhrase>(
          () => GetCollaboratorPhrase(
            contract: i<HomeContract>(),
          ),
        ),
        i.addSingleton<GetExistingCollaborationsInfo>(
          () => GetExistingCollaborationsInfo(
            contract: i<HomeContract>(),
          ),
        ),
        i.addSingleton<GetExistingCollaborationsInfoStore>(
          () => GetExistingCollaborationsInfoStore(
            logic: i<GetExistingCollaborationsInfo>(),
          ),
        ),
        i.addSingleton<AddNameToDatabaseStore>(
          () => AddNameToDatabaseStore(
            logic: i<AddNameToDatabase>(),
          ),
        ),
        i.addSingleton<GetCollaboratorPhraseStore>(
          () => GetCollaboratorPhraseStore(
            logic: i<GetCollaboratorPhrase>(),
          ),
        ),
        i.addSingleton<SmartTextStore>(
          () => SmartTextStore(),
        ),
        i.addSingleton<GesturePillStore>(
          () => GesturePillStore(endingPath: SvgAnimtionConstants.circlePath),
        ),
        i.addSingleton<HomeScreenCoordinatorStore>(
          () => HomeScreenCoordinatorStore(
            beachWaves: Modular.get<BeachWavesStore>(),
            getExistingCollaborationInfo:
                i<GetExistingCollaborationsInfoStore>(),
            hold: Modular.get<HoldDetector>(),
            swipe: Modular.get<SwipeDetector>(),
            gesturePillStore: i<GesturePillStore>(),
            addNameToDatabaseStore: i<AddNameToDatabaseStore>(),
            smartText: i<SmartTextStore>(),
            getCollaboratorPhraseStore: i<GetCollaboratorPhraseStore>(),
          ),
        ),
      ];

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreen(
        coordinator: Modular.get<HomeScreenCoordinatorStore>(),
      ),
    );
  }
}
