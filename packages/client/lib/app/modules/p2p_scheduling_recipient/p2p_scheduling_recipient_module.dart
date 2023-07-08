// ***************************************************
// * PRIMALA IMPORTS
///   * P2P Scheduling Shared CORE Imports
//        * Constants Imports
import 'package:primala/app/core/p2p_scheduling/constants/interaction_type.dart';
//        * Utils Imports
import 'package:primala/app/core/p2p_scheduling/utils/time_converter.dart';
//          * Logic
import 'package:primala/app/core/p2p_scheduling/domain/logic/order_spiral_colors.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
//              * Getters
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/getters/order_spiral_colors_getter_store.dart';
//              * Main
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/order_spiral_colors_store.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
// ******************END*OF*CORE**********************
///   * DATA Layer Imports
//        * Sources Imports
import 'package:primala/app/modules/p2p_scheduling_recipient/data/sources/p2p_scheduling_recipient_remote_source.dart';
//        * Contract Implementation Import
import 'package:primala/app/modules/p2p_scheduling_recipient/data/contracts/p2p_scheduling_recipient_contract_impl.dart';
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/contracts/p2p_scheduling_recipient_contract.dart';
//          * Logic
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/logic/respond_to_scheduling_request.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
//              * Getters
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/getters/respond_to_scheduling_request_getter_store.dart';
//              * Main
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/main/respond_to_scheduling_request_store.dart';
//          * Views
// import 'package:primala/app/modules/p2p_scheduling_sender/presentation/views/send_scheduling_request_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class P2PSchedulingRecipientModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<P2PSchedulingRecipientRemoteSourceImpl>(
          (i) => P2PSchedulingRecipientRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),

        // & Contract Implementation

        Bind.singleton<P2PSchedulingRecipientContractImpl>(
          (i) => P2PSchedulingRecipientContractImpl(
            networkInfo: Modular.get<NetworkInfo>(),
            remoteSource: i<P2PSchedulingRecipientRemoteSourceImpl>(),
          ),
        ),

        // & Logic

        Bind.singleton<OrderSpiralColors>(
          (i) => OrderSpiralColors(
            presentMoment: DateTime.now(),
            // presentMoment: DateTime(2023, 6, 19, 8, 48),
          ),
        ),

        Bind.singleton<RespondToSchedulingRequest>(
          (i) => RespondToSchedulingRequest(
            contract: i<P2PSchedulingRecipientContract>(),
          ),
        ),

        // & MobX Getter Stores

        Bind.singleton<OrderSpiralColorsGetterStore>(
          (i) => OrderSpiralColorsGetterStore(
            orderSpiralColors: i<OrderSpiralColors>(),
          ),
        ),

        Bind.singleton<RespondToSchedulingRequestGetterStore>(
          (i) => RespondToSchedulingRequestGetterStore(
            respondToSchedulingRequestLogic: i<RespondToSchedulingRequest>(),
          ),
        ),

        // & Mobx Mother Stores

        Bind.singleton<OrderSpiralColorsStore>(
          (i) => OrderSpiralColorsStore(
            orderSpiralColorsGetterStore: i<OrderSpiralColorsGetterStore>(),
          ),
        ),

        Bind.singleton<RespondToSchedulingRequestStore>(
          (i) => RespondToSchedulingRequestStore(
            respondToARequestGetterStore:
                i<RespondToSchedulingRequestGetterStore>(),
          ),
        ),
      ];
}
