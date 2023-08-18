import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:primala/app/modules/home/data/sources/home_remote_source.dart';
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart';
import 'package:primala/app/modules/home/domain/logic/logic.dart';
import 'package:primala/app/modules/home/presentation/mobx/mobx.dart';
import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/smart_fading_animated_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // & Remote Source
        Bind.singleton<HomeRemoteSourceImpl>(
          (i) => HomeRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<HomeContractImpl>(
          (i) => HomeContractImpl(
            remoteSource: i<HomeRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        // & Logic
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
        // & MobX Getter Stores
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
        // & Mobx Mother Stores
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
        // & Widget State Management Stores
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(),
        ),

        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          transition: TransitionType.noTransition,
          child: (context, args) => HomeScreen(
            fadingTextStateTrackerStore:
                Modular.get<SmartFadingAnimatedTextTrackerStore>(),
            addNameToDatabaseStore: Modular.get<AddNameToDatabaseStore>(),
            beachWaveStateTrackerStore: Modular.get<BeachWavesTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
            //     Modular.get<BreathingPentagonsStateTrackerStore>(),
            // supabase: Modular.get<SupabaseClient>(),
          ),
        )
      ];
}
