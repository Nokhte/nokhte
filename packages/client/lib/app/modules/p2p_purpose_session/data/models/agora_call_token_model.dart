import 'dart:convert';
import 'package:http/http.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
// import 'package:http/http.dart';

class AgoraCallTokenModel extends AgoraCallTokenEntity {
  const AgoraCallTokenModel({
    required super.returnedToken,
  });
  // assumes it's already vetted
  static AgoraCallTokenModel fromTokenServer(Response res) {
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      String newToken = json['rtcToken'];
      return AgoraCallTokenModel(returnedToken: newToken);
    } else {
      return const AgoraCallTokenModel(returnedToken: '');
    }
  }
}
