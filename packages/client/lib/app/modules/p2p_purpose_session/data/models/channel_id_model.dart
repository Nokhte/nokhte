import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class ChannelIdModel extends ChannelIdEntity {
  const ChannelIdModel({required super.channelId});

  static ChannelIdModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const ChannelIdModel(channelId: '');
    } else {
      final String collaboratorOne = sbQueryRes[0]["collaborator_one"];
      final String collaboratorTwo = sbQueryRes[0]["collaborator_two"];
      final channelId =
          "${collaboratorOne.substring(0, 4)}-${collaboratorTwo.substring(0, 4)}";
      return ChannelIdModel(channelId: channelId);
    }
  }
}
