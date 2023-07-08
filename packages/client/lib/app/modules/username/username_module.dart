// ***************************************************
// * PRIMALA IMPORTS
///   * DATA Layer Imports
//        * Sources Imports
import 'package:primala/app/modules/username/data/sources/username_remote_source.dart'; // ✅
//        * Model Imports
//        * Contract Implementation Import
import 'package:primala/app/modules/username/data/contracts/username_contract_impl.dart'; // ✅
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/username/domain/contracts/username_contract.dart';
//          * Logic
import 'package:primala/app/modules/username/domain/logic/check_if_username_is_created.dart';
import 'package:primala/app/modules/username/domain/logic/get_default_username.dart';
import 'package:primala/app/modules/username/domain/logic/create_username.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
import 'package:primala/app/modules/username/presentation/mobx/getters/check_if_username_is_created_getter_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/get_default_username_getter_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/getters/create_username_getter_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/check_if_username_is_created_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/get_default_username_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/create_username_store.dart';
//          * Views
import 'package:primala/app/modules/username/presentation/views/create_username_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class UsernameModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<UsernameRemoteSourceImpl>(
          (i) => UsernameRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<UsernameContractImpl>(
          (i) => UsernameContractImpl(
            remoteSource: i<UsernameRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<CreateUsername>(
          (i) => CreateUsername(
            contract: i<UsernameContract>(),
          ),
        ),
        Bind.singleton<GetDefaultUsername>(
          (i) => GetDefaultUsername(
            contract: i<UsernameContract>(),
          ),
        ),
        Bind.singleton<CheckIfUsernameIsCreated>(
          (i) => CheckIfUsernameIsCreated(
            contract: i<UsernameContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<CreateUsernameGetterStore>(
          (i) => CreateUsernameGetterStore(
            createLogic: i<CreateUsername>(),
          ),
        ),
        Bind.singleton<GetDefaultUsernameGetterStore>(
          (i) => GetDefaultUsernameGetterStore(
            defaultLogic: i<GetDefaultUsername>(),
          ),
        ),
        Bind.singleton<CheckIfUsernameIsCreatedGetterStore>(
          (i) => CheckIfUsernameIsCreatedGetterStore(
            checkLogic: i<CheckIfUsernameIsCreated>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<CreateUsernameStore>(
          (i) => CreateUsernameStore(
            createUsernameGetterStore: i<CreateUsernameGetterStore>(),
          ),
        ),
        Bind.singleton<GetDefaultUsernameStore>(
          (i) => GetDefaultUsernameStore(
            getDefaultUsernameGetterStore: i<GetDefaultUsernameGetterStore>(),
          ),
        ),
        Bind.singleton<CheckIfUsernameIsCreatedStore>(
          (i) => CheckIfUsernameIsCreatedStore(
            checkUsernameGetterStore: i<CheckIfUsernameIsCreatedGetterStore>(),
          ),
        ),
      ];
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => CreateUsernameScreen(
            createUsernameStore: Modular.get<CreateUsernameStore>(),
            getDefaultUsernameStore: Modular.get<GetDefaultUsernameStore>(),
            checkIfUsernameIsCreatedStore:
                Modular.get<CheckIfUsernameIsCreatedStore>(),
          ),
        ),
      ];
}
