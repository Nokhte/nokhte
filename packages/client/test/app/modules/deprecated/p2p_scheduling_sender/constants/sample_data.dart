class SampleData {
  static String get randomUID => 'f7755d65-60f8-42e1-8e08-98b008bdc6ab';
  static Map<String, dynamic> get successConfirmResponse =>
      {"time_is_agreed_upon": true};

  // $ Morning Times
  static String get june19th9AMtimestampz => '2023-06-19 09:00:00+00';
  static String get june19th10AMtimestampz => '2023-06-19 10:00:00+00';
  // $ Afternoon Times
  static String get june19th1PMtimestampz => '2023-06-19 13:00:00+00';
  static String get june19th2PMtimestampz => '2023-06-19 14:00:00+00';
  // $ Sample JSON query
  static Map<String, List> get jsonTimeRanges => {
        "ranges": [
          {
            "start": SampleData.june19th9AMtimestampz,
            "end": SampleData.june19th10AMtimestampz,
          },
          {
            "start": SampleData.june19th1PMtimestampz,
            "end": SampleData.june19th2PMtimestampz,
          },
        ]
      };
}
