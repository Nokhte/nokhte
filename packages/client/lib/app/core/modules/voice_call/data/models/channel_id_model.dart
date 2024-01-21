import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ChannelIdModel extends ChannelIdEntity {
  const ChannelIdModel({required super.channelId});

  static String fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return '';
    } else {
      final String collaboratorOne = sbQueryRes.first.first["collaborator_one"];
      final String collaboratorTwo = sbQueryRes.first.first["collaborator_two"];
      final channelId =
          "${collaboratorOne.substring(0, 19)}${collaboratorTwo.substring(0, 19)}";
      return channelId;
    }
  }
}
