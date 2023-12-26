class AvailabilitySectorConstants {
  static List<List<double>> get userArcStops => [
        [0.05, .2],
        [.71, .8],
        [.8, .93],
      ];
  static List<bool> get userArcShouldReverseStops => [false, false, false];
  static List<List<double>> get collaboratorArcStops => [
        [.1, .15],
        [.65, .83],
        [.71, .8],
      ];
  static List<bool> get collaboratorArcShouldReverseStops =>
      [false, true, false];
  static List<double> get userArcLengths => [6.83, 10.38, 10.09];
  static List<double> get collaboratorArcLengths => [5.43, 8.3, 10.38];
}
