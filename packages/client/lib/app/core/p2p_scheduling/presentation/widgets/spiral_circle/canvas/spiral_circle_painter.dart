import 'package:flutter/material.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_selection_state_type.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
import 'package:touchable/touchable.dart';
import 'spiral_circle_api.dart';

class SpiralCirclePainter extends CustomPainter {
  BuildContext context;
  List<String> reverseOrderedTimes;
  SpiralInteractionType interactionType;
  SpiralSelectionState selectedState;
  SchedulingRequestTimesStore schedulingRequestTimesStore;

  SpiralCirclePainter({
    required this.context,
    required this.reverseOrderedTimes,
    required this.interactionType,
    required this.selectedState,
    required this.schedulingRequestTimesStore,
  });

  @override
  void paint(Canvas canvas, Size size) {
    TouchyCanvas touchyCanvas = TouchyCanvas(context, canvas);
    SpiralCircleAPI.programAndRenderSpiral(
      canvas: touchyCanvas,
      size: size,
      reverseOrderedTimes: reverseOrderedTimes,
      interactionType: interactionType,
      selectedState: selectedState,
      schedulingRequestTimesStore: schedulingRequestTimesStore,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
