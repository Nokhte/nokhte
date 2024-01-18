// ignore_for_file: must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';

@GenerateNiceMocks([
  MockSpec<VoiceCallRemoteSourceImpl>(),
  MockSpec<VoiceCallContract>(),
  MockSpec<GetAgoraToken>(),
  MockSpec<GetChannelId>(),
  MockSpec<InitAgoraSdk>(),
  MockSpec<JoinCall>(),
  MockSpec<LeaveCall>(),
  MockSpec<MuteLocalAudio>(),
  MockSpec<UnmuteLocalAudio>(),
  MockSpec<GetAgoraTokenStore>(),
  MockSpec<GetChannelIdStore>(),
  MockSpec<InitAgoraSdkStore>(),
  MockSpec<VoiceCallActionsStore>(),
])
void main() {}
