extension IntComparisons on int {
  bool isLessThan(int value) => this < value;
  bool isGreaterThan(int value) => this > value;
  bool isLessThanOrEqualTo(int value) => this <= value;
  bool isGreaterThanOrEqualTo(int value) => this >= value;
  bool equals(int value) => this == value;
}
