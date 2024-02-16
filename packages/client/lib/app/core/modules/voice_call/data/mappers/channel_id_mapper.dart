mixin ChannelIdMapper {
  static String fromCollaborationRow(List sbQueryRes) {
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
