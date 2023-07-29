class FindClosestIncrement {
  static double call(double input) {
    int numberOfIncrements = (input / 1.25).round();
    double closestValue = numberOfIncrements * 1.25;
    return closestValue;
  }
}
