// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/videosdk/videosdk.dart';

void main() {
  test("should get a video sdk token", () async {
    final res = await VideoSdkServices.getToken();
    final body = jsonDecode(res.body) as Map;
    expect(res.statusCode, 200);
    expect(body["token"], isNotEmpty);
  });

  test("should create a meeting and return the roomId", () async {
    final tokenRes = await VideoSdkServices.getToken();
    final meetingRes = await VideoSdkServices.createMeeting(
        jsonDecode(tokenRes.body)["token"] as String);
    final meetingBody = jsonDecode(meetingRes.body) as Map;
    print(meetingBody);
    expect(meetingBody["roomId"], isNotEmpty);
  });
}
