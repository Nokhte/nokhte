import 'package:flutter/material.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_selection_state_type.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
import 'package:touchable/touchable.dart';
import 'canvas/spiral_circle_painter.dart';

class SpiralCircle extends StatelessWidget {
  final List<String> reverseOrderedTimes;
  final SpiralInteractionType interactionType;
  final SpiralSelectionState selectedState;
  final SchedulingRequestTimesStore schedulingRequestTimesStore;
  const SpiralCircle({
    super.key,
    required this.reverseOrderedTimes,
    required this.interactionType,
    required this.selectedState,
    required this.schedulingRequestTimesStore,
  });

  @override
  Widget build(BuildContext context) {
    return CanvasTouchDetector(
        gesturesToOverride: const [
          GestureType.onTapDown,
          GestureType.onPanDown,
          GestureType.onPanStart,
          GestureType.onPanUpdate
        ],
        builder: (context) {
          double width = MediaQuery.of(context).size.width;
          var padding = MediaQuery.of(context).padding;
          double unrefinedHeight = MediaQuery.of(context).size.height;
          double height = unrefinedHeight - padding.top - padding.bottom;
          double desiredSize = width < height ? width * .95 : height * .95;
          Size size = Size(desiredSize, desiredSize);

          return CustomPaint(
            size: size,
            painter: SpiralCirclePainter(
              context: context,
              reverseOrderedTimes: reverseOrderedTimes,
              interactionType: interactionType,
              selectedState: selectedState,
              schedulingRequestTimesStore: schedulingRequestTimesStore,
            ),
          );
        });
  }
}
