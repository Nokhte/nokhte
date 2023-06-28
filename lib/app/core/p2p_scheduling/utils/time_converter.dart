class TimeConverter {
  final DateTime presentMoment;

  TimeConverter({required this.presentMoment});

  String hrToTimestampz(String input) {
    DateTime dateTime = DateTime(
        presentMoment.year,
        presentMoment.month,
        presentMoment.day,
        int.parse(input.split(':')[0]),
        int.parse(input.split(':')[1]));
    return dateTime.toIso8601String();
  }
}
