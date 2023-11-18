class DurationUtils {
  static bool isMoreThanAnHour({
    required DateTime startTime,
    required DateTime endTime,
  }) {
    final dateDifference = startTime.difference(endTime).inMinutes;
    return dateDifference > 60;
  }
}
