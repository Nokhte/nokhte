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
import 'package:primala/app/modules/p2p_scheduling_sender/data/sources/p2p_scheduling_sender_remote_source.dart'; // ✅
//        * Contract Implementation Import
import 'package:primala/app/modules/p2p_scheduling_sender/data/contracts/p2p_scheduling_sender_contract_impl.dart';
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/p2p_scheduling_sender/domain/contracts/p2p_scheduling_sender_contract.dart';
//          * Logic
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/send_scheduling_request.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
//              * Getters
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/send_scheduling_request_getter_store.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/confirm_scheduling_time_getter_store.dart';
//              * Main
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/send_scheduling_request_store.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/confirm_scheduling_time_store.dart';
//          * Views
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/views/send_scheduling_request_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class P2PSchedulingSenderModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source

        Bind.singleton<P2PSchedulingSenderRemoteSourceImpl>(
          (i) => P2PSchedulingSenderRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation

        Bind.singleton<P2PSchedulingSenderContractImpl>(
          (i) => P2PSchedulingSenderContractImpl(
            networkInfo: Modular.get<NetworkInfoImpl>(),
            remoteSource: i<P2PSchedulingSenderRemoteSourceImpl>(),
          ),
        ),
        // & Logic

        Bind.singleton<ConfirmSchedulingTime>((i) => ConfirmSchedulingTime(
              contract: i<P2PSchedulingSenderContract>(),
            )),

        Bind.singleton<OrderSpiralColors>(
          (i) => OrderSpiralColors(
            // presentMoment: DateTime.now(),
            presentMoment: DateTime(2023, 6, 19, 3, 0),
          ),
        ),

        Bind.singleton<SendSchedulingRequest>(
          (i) => SendSchedulingRequest(
            contract: i<P2PSchedulingSenderContract>(),
          ),
        ),

        // & MobX Getter Stores

        Bind.singleton<ConfirmSchedulingTimeGetterStore>(
          (i) => ConfirmSchedulingTimeGetterStore(
            confirmSchedulingTimeLogic: i<ConfirmSchedulingTime>(),
          ),
        ),

        Bind.singleton<OrderSpiralColorsGetterStore>(
          (i) => OrderSpiralColorsGetterStore(
            orderSpiralColors: i<OrderSpiralColors>(),
          ),
        ),

        Bind.singleton<SendSchedulingRequestGetterStore>(
          (i) => SendSchedulingRequestGetterStore(
            sendSchedulingRequestLogic: i<SendSchedulingRequest>(),
          ),
        ),

        // & Mobx Mother Stores

        Bind.singleton<ConfirmSchedulingTimeStore>(
          (i) => ConfirmSchedulingTimeStore(
            confirmSchedulingTimeGetterStore:
                i<ConfirmSchedulingTimeGetterStore>(),
          ),
        ),

        Bind.singleton<SchedulingRequestTimesStore>(
          (i) => SchedulingRequestTimesStore(
            interactionType: InteractionType.range,
            timeConverter: TimeConverter(
              presentMoment: DateTime.now(),
            ),
          ),
        ),

        Bind.singleton<SendSchedulingRequestStore>(
          (i) => SendSchedulingRequestStore(
            sendSchedulingRequestGetterStore:
                i<SendSchedulingRequestGetterStore>(),
          ),
        ),

        Bind.singleton<OrderSpiralColorsStore>(
          (i) => OrderSpiralColorsStore(
            orderSpiralColorsGetterStore: i<OrderSpiralColorsGetterStore>(),
          ),
        ),
      ];
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => SendScheduilngRequestScreen(
            orderSpiralColorsStore: Modular.get<OrderSpiralColorsStore>(),
            schedulingRequestTimesStore:
                Modular.get<SchedulingRequestTimesStore>(),
          ),
        ),
      ];
}
