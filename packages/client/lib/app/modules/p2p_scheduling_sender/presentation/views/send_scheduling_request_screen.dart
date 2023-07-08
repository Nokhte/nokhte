// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/p2p_scheduling/constants/interaction_type.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/order_spiral_colors_store.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/widgets/spiral_circle/spiral_circle.dart';

class SendScheduilngRequestScreen extends StatefulWidget {
  final OrderSpiralColorsStore orderSpiralColorsStore;
  final SchedulingRequestTimesStore schedulingRequestTimesStore;
  const SendScheduilngRequestScreen({
    Key? key,
    required this.orderSpiralColorsStore,
    required this.schedulingRequestTimesStore,
  }) : super(key: key);

  @override
  _SendScheduilngRequestScreenState createState() =>
      _SendScheduilngRequestScreenState(
        orderSpiralColorsStore: orderSpiralColorsStore,
        schedulingRequestTimesStore: schedulingRequestTimesStore,
      );
}

class _SendScheduilngRequestScreenState
    extends State<SendScheduilngRequestScreen> {
  final OrderSpiralColorsStore orderSpiralColorsStore;
  final SchedulingRequestTimesStore schedulingRequestTimesStore;

  _SendScheduilngRequestScreenState({
    required this.orderSpiralColorsStore,
    required this.schedulingRequestTimesStore,
  });

  @override
  void initState() {
    super.initState();
    orderSpiralColorsStore(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(-20, 4),
              blurRadius: 2,
            ),
          ],
          gradient: SweepGradient(
            center: FractionalOffset.center,
            startAngle: 3,
            endAngle: 2 * 3.14,
            colors: [
              const Color(0xFF4BCF68),
              const Color(0xFFFFF680).withOpacity(0.762727),
              const Color(0xFF4BCF68),
            ],
            stops: const [0.104163, 0.500149, 0.88107],
          ),
        ),
        child: PlatformScaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Observer(
              builder: (context) {
                return SpiralCircle(
                  reverseOrderedTimes: orderSpiralColorsStore.orderedTimes,
                  interactionType: InteractionType.range,
                  selectedState: schedulingRequestTimesStore.selectedState,
                  schedulingRequestTimesStore: schedulingRequestTimesStore,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
