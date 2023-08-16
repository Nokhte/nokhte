import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/types.dart';
import 'package:primala/app/modules/home/data/contracts/home_contract_impl.dart';
import 'package:primala/app/modules/home/data/sources/home_remote_source.dart';
import 'package:primala/app/modules/home/domain/contracts/home_contract.dart';
import 'package:primala/app/modules/home/domain/logic/add_name_to_database.dart';
import 'package:primala/app/modules/home/presentation/mobx/getter/add_name_to_database_getter_store.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';
// import 'package:primala/app/core/widgets/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';

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
        // & MobX Getter Stores
        Bind.singleton<AddNameToDatabaseGetterStore>(
          (i) => AddNameToDatabaseGetterStore(
            addNameLogic: i<AddNameToDatabase>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<AddNameToDatabaseStore>(
          (i) => AddNameToDatabaseStore(
            addNameGetterStore: i<AddNameToDatabaseGetterStore>(),
          ),
        ),

        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(defaultMovieMode: MovieModes.onShore),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          transition: TransitionType.noTransition,
          child: (context, args) => HomeScreen(
            addNameToDatabaseStore: Modular.get<AddNameToDatabaseStore>(),
            stateTrackerStore: Modular.get<BeachWavesTrackerStore>(),
            supabase: Modular.get<SupabaseClient>(),
            //     Modular.get<BreathingPentagonsStateTrackerStore>(),
            // supabase: Modular.get<SupabaseClient>(),
          ),
        )
      ];
}
