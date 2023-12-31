import 'package:http/http.dart';

class TokenServices {
  static Future<Response> getAgoraToken({
    int currentUserUID = 0,
    required String channelName,
    int tokenRole = 1,
    int tokenExpireTime = 95,
  }) async {
    const serverUrl = 'https://agora-token-server-h5o3.onrender.com';
    String url =
        '$serverUrl/rtc/$channelName/${tokenRole.toString()}/uid/${currentUserUID.toString()}';
    return await get(Uri.parse(url));
  }
}
