import '../../p2p_scheduling_sender/constants/sample_data.dart' as sd;

class SampleData {
  static Map<String, dynamic> get successRespondRes => {
        "range_has_been_responded_to": true,
        "response_timestampz": sd.SampleData.june19th10AMtimestampz
      };
  static Map<String, dynamic> get notSuccessRespondRes => {
        "range_has_been_responded_to": false,
        "response_timestampz": null,
      };
}
