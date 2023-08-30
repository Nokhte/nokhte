import 'package:http/http.dart';

class TokenServer {
  static Future<Response> fetchAgoraToken({
    required String currentUserUID,
    required String channelName,
    int tokenRole = 1,
    int tokenExpireTime = 95,
  }) async {
    const serverUrl = 'https://agora-token-server-h5o3.onrender.com';
    String url =
        '$serverUrl/rtc/$channelName/${tokenRole.toString()}/userAccount/$currentUserUID?expiry=${tokenExpireTime.toString()}';
    return await get(Uri.parse(url));
  }
}
