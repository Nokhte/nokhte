import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/widgets.dart';

class ReturnDateOrTimeArray extends AbstractSyncNoFailureLogic<
    List<GeneralDateTimeReturnType>, ReturnDateOrTimeArrayParams> {
  @override
  call(params) {
    DateTime currentDate = params.currentTime;
    switch (params.dateOrTime) {
      case DateOrTime.date:
        List<Date> dateArray = [];
        for (int i = 0; i < 4; i++) {
          final String formatted = _formatDateTime(currentDate);
          dateArray.add(Date(formatted: formatted, unformatted: currentDate));
          currentDate = currentDate.add(const Duration(days: 1));
        }
        return dateArray;
      case DateOrTime.time:
        List<Time> timeArray = [];

        for (int hour = 0; hour < 24; hour++) {
          final String formatted = _formatTime(hour, params.currentTime);
          final bool isTheActiveOne = hour == params.currentTime.hour;
          timeArray.add(
            Time(
              formatted: formatted,
              unformatted: DateTime(
                params.currentTime.year,
                params.currentTime.month,
                params.currentTime.day,
                hour,
              ),
              isTheActiveOne: isTheActiveOne,
            ),
          );
        }
        return timeArray;
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
