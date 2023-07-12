// ***************************************************
// * PRIMALA IMPORTS
///   * DATA Layer Imports
//        * Sources Imports
import 'package:primala/app/modules/deprecated/p2p_request_recipient/data/sources/p2p_request_recipient_remote_source.dart'; // ✅
//        * Model Imports
//        * Contract Implementation Import
import 'package:primala/app/modules/deprecated/p2p_request_recipient/data/contracts/p2p_request_recipient_contract_impl.dart'; // ✅
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/contracts/p2p_request_recipient_contract.dart';
//          * Logic
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/logic/load_the_requests.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/getters/load_the_requests_getter_store.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/getters/respond_to_a_request_getter_store.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/main/load_the_requests_store.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/mobx/main/respond_to_a_request_store.dart';
//          * Views
import 'package:primala/app/modules/deprecated/p2p_request_recipient/presentation/views/view_and_respond_to_requests_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class P2PRequestRecipientModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<P2PRequestRecipientRemoteSourceImpl>(
          (i) => P2PRequestRecipientRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<P2PRequestRecipientContractImpl>(
          (i) => P2PRequestRecipientContractImpl(
            networkInfo: Modular.get<NetworkInfoImpl>(),
            remoteSource: i<P2PRequestRecipientRemoteSourceImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<LoadTheRequests>(
          (i) => LoadTheRequests(
            contract: i<P2PRequestRecipientContract>(),
            presentMoment: DateTime.now(),
          ),
        ),
        Bind.singleton<RespondToARequest>(
          (i) => RespondToARequest(
            contract: i<P2PRequestRecipientContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<LoadTheRequestsGetterStore>(
          (i) => LoadTheRequestsGetterStore(
            loadLogic: i<LoadTheRequests>(),
          ),
        ),
        Bind.singleton<RespondToARequestGetterStore>(
          (i) => RespondToARequestGetterStore(
            respondLogic: i<RespondToARequest>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<LoadTheRequestsStore>(
          (i) => LoadTheRequestsStore(
            loadTheRequestsGetterStore: i<LoadTheRequestsGetterStore>(),
          ),
        ),
        Bind.singleton<RespondToARequestStore>(
          (i) => RespondToARequestStore(
            respondToRequestGetterStore: i<RespondToARequestGetterStore>(),
          ),
        ),
      ];

  // add routes tmw & finish this up
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => ViewAndRespondToRequestsScreen(
            respondToARequestStore: Modular.get<RespondToARequestStore>(),
            loadRequestsStore: Modular.get<LoadTheRequestsStore>(),
          ),
        )
      ];
}
