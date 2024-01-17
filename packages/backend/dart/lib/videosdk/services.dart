import 'package:http/http.dart';

class VideoSdkServices {
  static Future<Response> getToken() async {
    const serverUrl = 'https://video-sdk-token-server.onrender.com';
    final queryUrl = '$serverUrl/get-token';
    return await get(Uri.parse(queryUrl));
  }

  static Future<Response> createMeeting(String token) async {
    final response = await post(
      Uri.parse(
        "https://api.videosdk.live/v2/rooms",
      ),
      headers: {'Authorization': token},
    );
    return response;
  }
}
