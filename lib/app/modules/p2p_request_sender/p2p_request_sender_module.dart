// ***************************************************
// * PRIMALA IMPORTS
///   * DATA Layer Imports
//        * Sources Imports
import 'package:primala/app/modules/p2p_request_sender/data/sources/p2p_request_sender_remote_source.dart'; // ✅
//        * Model Imports
//        * Contract Implementation Import
import 'package:primala/app/modules/p2p_request_sender/data/contracts/p2p_request_sender_contract_impl.dart'; // ✅
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/p2p_request_sender/domain/contracts/p2p_request_sender_contract.dart';
//          * Logic
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/send_a_request.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/getters/validate_request_getter_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/getters/send_a_request_getter_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/validate_request_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/send_a_request_store.dart';
//          * Views
import 'package:primala/app/modules/p2p_request_sender/presentation/views/send_a_request_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class P2PRequestSenderModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<P2PRequestSenderRemoteSourceImpl>(
          (i) => P2PRequestSenderRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<P2PRequestSenderContractImpl>(
          (i) => P2PRequestSenderContractImpl(
            remoteSource: i<P2PRequestSenderRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<ValidateRequest>(
          (i) => ValidateRequest(
            contract: i<P2PRequestSenderContract>(),
          ),
        ),
        Bind.singleton<SendARequest>(
          (i) => SendARequest(
            contract: i<P2PRequestSenderContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<ValidateRequestGetterStore>(
          (i) => ValidateRequestGetterStore(
            validateRequest: i<ValidateRequest>(),
          ),
        ),
        Bind.singleton<SendARequestGetterStore>(
          (i) => SendARequestGetterStore(
            sendLogic: i<SendARequest>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<ValidateRequestStore>(
          (i) => ValidateRequestStore(
            validateRequestGetterStore: i<ValidateRequestGetterStore>(),
          ),
        ),
        Bind.singleton<SendARequestStore>(
          (i) => SendARequestStore(
            sendARequestGetterStore: i<SendARequestGetterStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => SendARequestScreen(
            validateRequestStore: Modular.get<ValidateRequestStore>(),
            sendARequestStore: Modular.get<SendARequestStore>(),
          ),
        )
      ];
}
