class Seconds {
  static Duration get(int numberOfSeconds, {int milli = 0}) {
    return Duration(seconds: numberOfSeconds, milliseconds: milli);
  }
}
