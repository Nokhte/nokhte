import 'dart:convert';
import 'package:http/http.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class AgoraCallTokenModel extends AgoraCallTokenEntity {
  const AgoraCallTokenModel({
    required super.returnedToken,
  });
  factory AgoraCallTokenModel.fromTokenServer(Response res) {
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      String newToken = json['rtcToken'];
      return AgoraCallTokenModel(returnedToken: newToken);
    } else {
      return const AgoraCallTokenModel(returnedToken: '');
    }
  }
}
