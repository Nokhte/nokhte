import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/get_current_perspectives_module.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:nokhte/app/modules/home/data/sources/home_remote_source.dart';
import 'package:nokhte/app/modules/home/domain/contracts/home_contract.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator_store.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        GyroscopicModule(),
        GesturesModule(),
        GetCurrentPerspectivesModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.singleton<HomeRemoteSourceImpl>(
          (i) => HomeRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        Bind.singleton<HomeContractImpl>(
          (i) => HomeContractImpl(
            remoteSource: i<HomeRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        Bind.singleton<AddNameToDatabase>(
          (i) => AddNameToDatabase(
            contract: i<HomeContract>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPhrase>(
          (i) => GetCollaboratorPhrase(
            contract: i<HomeContract>(),
          ),
        ),
        Bind.singleton<AddNameToDatabaseGetterStore>(
          (i) => AddNameToDatabaseGetterStore(
            addNameLogic: i<AddNameToDatabase>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPhraseGetterStore>(
          (i) => GetCollaboratorPhraseGetterStore(
            getCollaboratorPhraseLogic: i<GetCollaboratorPhrase>(),
          ),
        ),
        Bind.singleton<AddNameToDatabaseStore>(
          (i) => AddNameToDatabaseStore(
            addNameGetterStore: i<AddNameToDatabaseGetterStore>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPhraseStore>(
          (i) => GetCollaboratorPhraseStore(
            getCollaboratorPhraseGetterStore:
                i<GetCollaboratorPhraseGetterStore>(),
          ),
        ),
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: true,
            messagesData: MessagesData.homeList,
          ),
        ),
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.singleton<GesturePillStore>(
          (i) => GesturePillStore(endingPath: SvgAnimtionConstants.circlePath),
        ),
        Bind.singleton<HomeScreenCoordinatorStore>(
          (i) => HomeScreenCoordinatorStore(
            getCurrentPerspectives: Modular.get<GetCurrentPerspectivesStore>(),
            portalAPI: i<PortalAPI>(),
            hold: Modular.get<HoldDetector>(),
            swipe: Modular.get<SwipeDetector>(),
            gesturePillStore: i<GesturePillStore>(),
            beachWaves: i<BeachWavesTrackerStore>(),
            addNameToDatabaseStore: i<AddNameToDatabaseStore>(),
            fadingTextStateTrackerStore:
                i<SmartFadingAnimatedTextTrackerStore>(),
            getCollaboratorPhraseStore: i<GetCollaboratorPhraseStore>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          transition: TransitionType.noTransition,
          child: (context, args) => HomeScreen(
            coordinator: Modular.get<HomeScreenCoordinatorStore>(),
          ),
        )
      ];
}
