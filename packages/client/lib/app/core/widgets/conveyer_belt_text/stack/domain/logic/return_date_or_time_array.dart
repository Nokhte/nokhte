import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/widgets.dart';

class ReturnDateOrTimeArray extends AbstractSyncNoFailureLogic<
    ReturnDateOrTimeEntity, ReturnDateOrTimeArrayParams> {
  @override
  call(params) {
    DateTime currentDate = params.currentTime;
    int activeOneIndex = 0;
    switch (params.dateOrTime) {
      case DateOrTime.date:
        return _returnDateEntity(currentDate, activeOneIndex);
      case DateOrTime.time:
        return _returnTimeEntity(currentDate, activeOneIndex);
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM. d');
    final String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  String _formatTime(int hour, DateTime currentDate) {
    final DateFormat formatter = DateFormat.jm();
    final DateTime time =
        DateTime(currentDate.year, currentDate.month, currentDate.day, hour);
    final String formattedTime = formatter.format(time);
    return formattedTime;
  }

  ReturnDateOrTimeEntity _returnDateEntity(
      DateTime currentDate, int activeOneIndex) {
    List<Date> dateArray = [];
    currentDate = currentDate.subtract(const Duration(days: 2));
    for (int i = 0; i < 6; i++) {
      final isTheActiveOne = i == 1 ? true : false;
      final isBelowMinDate = i < 2 ? true : false;
      isTheActiveOne ? {activeOneIndex = i} : null;
      final String formatted = _formatDateTime(currentDate);
      dateArray.add(
        Date(
          formatted: formatted,
          unformatted: currentDate,
          isTheActiveOne: isTheActiveOne,
          isBelowMinDate: isBelowMinDate,
        ),
      );
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return ReturnDateOrTimeEntity(
      dateOrTimeList: dateArray,
      activeSelectionIndex: activeOneIndex,
    );
  }

  ReturnDateOrTimeEntity _returnTimeEntity(
      DateTime currentDate, int activeOneIndex) {
    List<Time> timeArray = [];

    for (int hour = 0; hour < 24; hour++) {
      final String formatted = _formatTime(hour, currentDate);
      final bool isTheActiveOne = hour == currentDate.hour;
      if (isTheActiveOne) {
        print("ACTIVE $hour");
      }
      const isBelowMinDate = false;
      isTheActiveOne ? {activeOneIndex = hour} : null;
      timeArray.add(
        Time(
          formatted: formatted,
          unformatted: DateTime(
            currentDate.year,
            currentDate.month,
            currentDate.day,
            hour,
          ),
          isTheActiveOne: isTheActiveOne,
          isBelowMinDate: isBelowMinDate,
        ),
      );
    }
    return ReturnDateOrTimeEntity(
      dateOrTimeList: timeArray,
      activeSelectionIndex: activeOneIndex,
    );
  }
}

class ReturnDateOrTimeArrayParams extends Equatable {
  final DateOrTime dateOrTime;
  final DateTime currentTime;

  const ReturnDateOrTimeArrayParams({
    required this.dateOrTime,
    required this.currentTime,
  });

  @override
  List<Object> get props => [
        dateOrTime,
        currentTime,
      ];
}
