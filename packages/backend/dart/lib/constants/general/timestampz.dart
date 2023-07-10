class Timestampz {
  static String get juneTenthNineAM => '2023-06-10 09:00:00.000000+00';
  static String get juneTenthTenAM => '2023-06-10 10:00:00.000000+00';
  static String get juneTenthTwoPM => '2023-06-10 14:00:00.000000+00';
  static String get juneTenthThreePM => '2023-06-10 15:00:00.000000+00';
  static List<Map<String, dynamic>> get juneTenthMorningRanges => [
        {
          "start": juneTenthNineAM,
          "end": juneTenthTenAM,
        },
      ];
  static List<Map<String, dynamic>> get juneTenthAfternoonRanges => [
        {
          "start": juneTenthThreePM,
          "end": juneTenthThreePM,
        }
      ];

  static List<Map<String, dynamic>> get juneTenthMorningAndAfternoonRanges => [
        {
          "start": juneTenthNineAM,
          "end": juneTenthTenAM,
        },
        {
          "start": juneTenthThreePM,
          "end": juneTenthThreePM,
        },
      ];
}
