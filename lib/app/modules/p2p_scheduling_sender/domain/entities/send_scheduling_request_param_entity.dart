// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SendSchedulingRequestParamEntity extends Equatable {
  /// so now it has an
  final List<IndividualTimeRange> timeRangeList;
  final String receiverUID;

  const SendSchedulingRequestParamEntity(
      {required this.timeRangeList, required this.receiverUID});

  @override
  List<Object> get props => [timeRangeList, receiverUID];

  Map<String, List> timeRangesToJson() {
    final List<Map> returnArr = [];
    for (int i = 0; i < timeRangeList.length; i++) {
      returnArr.add(timeRangeList[i].toJson());
    }

    return {
      "ranges": returnArr,
    };
  }
}

// @ dev: assumes times are of the timestampz type
class IndividualTimeRange extends Equatable {
  String startTime;
  String endTime;

  IndividualTimeRange({required this.startTime, required this.endTime});

  Map<String, String> toJson() {
    return {
      "start": startTime,
      "end": endTime,
    };
  }

  @override
  List<Object> get props => [startTime, endTime];
}
