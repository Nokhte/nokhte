import 'package:http/http.dart';

class TokenServerResponse {
  static Response get successfulResponse => Response(
        '{"rtcToken":"someReturnedToken"}',
        200,
      );
  static Response get notSuccessfulResponse => Response(
        '{"error":"Error Generating RTC token - failed to parse uidStr: sdse0, to uint causing error: strconv.ParseUint: parsing \"sdse0\": invalid syntax"}',
        400,
      );
}
