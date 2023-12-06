// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';

class MVoiceCallRemoteSourceImpl extends Mock
    implements VoiceCallRemoteSourceImpl {}

class MVoiceCallContract extends Mock implements VoiceCallContract {}

class MGetAgoraToken extends Mock implements GetAgoraToken {}

class MGetChannelId extends Mock implements GetChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudio extends Mock implements MuteLocalAudio {}

class MUnmuteLocalAudio extends Mock implements UnmuteLocalAudio {}

class MGetAgoraTokenStore extends Mock implements GetAgoraTokenStore {}

class MGetChannelIdStore extends Mock implements GetChannelIdStore {}

class MInstantiateAgoraSdkStore extends Mock
    implements InstantiateAgoraSdkStore {}

class MVoiceCallActionsStore extends Mock implements VoiceCallActionsStore {}

@GenerateMocks([
  MVoiceCallRemoteSourceImpl,
  MVoiceCallContract,
  MGetAgoraToken,
  MGetChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudio,
  MUnmuteLocalAudio,
  MGetAgoraTokenStore,
  MGetChannelIdStore,
  MInstantiateAgoraSdkStore,
  MVoiceCallActionsStore,
])
void main() {}
