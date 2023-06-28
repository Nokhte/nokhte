import 'package:flutter/material.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_selection_state_type.dart';
import 'package:primala/app/core/p2p_scheduling/constants/touch_types.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/spiral_circle_entity.dart';
import 'package:primala/app/core/p2p_scheduling/presentation/mobx/main/scheduling_request_times_store.dart';
import 'package:touchable/touchable.dart';
import 'spiral_paths.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_colors.dart';
import 'package:primala/app/core/p2p_scheduling/constants/interaction_type.dart';

class SpiralCircleAPI {
  static void programAndRenderSpiral({
    required TouchyCanvas canvas,
    required Size size,
    required List<String> reverseOrderedTimes,
    required InteractionType interactionType,
    required SpiralSelectionState selectedState,
    required SchedulingRequestTimesStore schedulingRequestTimesStore,
  }) {
    for (int i = 0; i < SpiralPaths.list.length; i++) {
      PathId currentPath = SpiralPaths.list[i];
      if (currentPath.circleType != Circles.spiralCircle) {
        canvas.drawPath(
          currentPath.pathInformation(size),
          currentPath.fillInformation(
            size,
          ),
        );
      } else {
        canvas.drawPath(
          currentPath.pathInformation(size),
          currentPath.fillInformation(
            size,
            SpiralColors.timeColorsMapping[
                reverseOrderedTimes[currentPath.indexIdentifier]],
          ),
          onTapDown: (details) {
            if (interactionType == InteractionType.single) {
              schedulingRequestTimesStore.updateState(SpiralCircleEntity(
                touchType: TouchTypes.tapDown,
                hrTime: reverseOrderedTimes[currentPath.indexIdentifier],
              ));
            }
          },
          onPanUpdate: (details) {
            if (interactionType == InteractionType.range) {
              schedulingRequestTimesStore.updateState(SpiralCircleEntity(
                touchType: TouchTypes.panUpdate,
                hrTime: reverseOrderedTimes[currentPath.indexIdentifier],
              ));
            }
          },
          onPanDown: (details) {
            if (interactionType == InteractionType.range) {
              // print(reverseOrderedTimes);
              // print(
              //     'pandown ${reverseOrderedTimes[SpiralPaths.list[i].indexIdentifier].toString()}');
              schedulingRequestTimesStore.updateState(
                SpiralCircleEntity(
                  touchType: TouchTypes.panDown,
                  hrTime:
                      reverseOrderedTimes[SpiralPaths.list[i].indexIdentifier],
                ),
              );
            }
          },
        );
      }
    }
  }
}
// @dev note that onPanUpdate will have to be used to track the end