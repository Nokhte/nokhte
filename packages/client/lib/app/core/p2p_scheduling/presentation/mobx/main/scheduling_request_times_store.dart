// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/p2p_scheduling/constants/default_entities.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/core/p2p_scheduling/constants/spiral_selection_state_type.dart';
import 'package:primala/app/core/p2p_scheduling/constants/touch_types.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/spiral_circle_entity.dart';
import 'package:primala/app/core/p2p_scheduling/utils/time_converter.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';
// * Mobx Codegen Inclusion
part 'scheduling_request_times_store.g.dart';

class SchedulingRequestTimesStore = _SchedulingRequestTimesStoreBase
    with _$SchedulingRequestTimesStore;

//  TimeConverter timeConverterService

abstract class _SchedulingRequestTimesStoreBase extends Equatable with Store {
  @observable
  SpiralSelectionState selectedState = DefaultP2PScheduling.rangeEntity;

  TimeConverter timeConverter = DefaultP2PScheduling.timeConverter;

  _SchedulingRequestTimesStoreBase({
    required SpiralInteractionType interactionType,
    required this.timeConverter,
  }) {
    selectedState = interactionType == SpiralInteractionType.range
        ? DefaultP2PScheduling.rangeEntity
        : DefaultP2PScheduling.singleTimeEntity;
  }

  @action
  updateState(SpiralCircleEntity touchPayload) {
    final convertedTime = timeConverter.hrToTimestampz(
      touchPayload.hrTime,
    );
    selectedState.fold((range) {
      int lastIndex = range.isNotEmpty ? range.length - 1 : 0;
      if (touchPayload.touchType == TouchTypes.panDown) {
        range.add(IndividualTimeRange(startTime: convertedTime, endTime: ''));
        // print('DOWN / START ${range[lastIndex]}');
      } else if (touchPayload.touchType == TouchTypes.panUpdate) {
        range[lastIndex].endTime = convertedTime;
        // print('UPDATE ${range[lastIndex]}');
      }
      // print('UPDATE $range');
    }, (single) {
      single = convertedTime;
    });
  }

  @override
  List<Object> get props => [selectedState];
}
// ^^ TODO test this
