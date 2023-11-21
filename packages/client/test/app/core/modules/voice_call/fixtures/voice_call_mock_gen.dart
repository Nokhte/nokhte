// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';

class MVoiceCallRemoteSourceImpl extends Mock
    implements VoiceCallRemoteSourceImpl {}

class MVoiceCallContract extends Mock implements VoiceCallContract {}

class MCheckIfUserHasTheQuestion extends Mock
    implements CheckIfUserHasTheQuestion {}

class MGetAgoraToken extends Mock implements GetAgoraToken {}

class MGetChannelId extends Mock implements GetChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudioStream extends Mock implements MuteLocalAudioStream {}

class MUnmuteLocalAudioStream extends Mock implements UnmuteLocalAudioStream {}

class MCheckIfUserHasTheQuestionGetterStore extends Mock
    implements CheckIfUserHasTheQuestionGetterStore {}

class MGetAgoraTokenGetterStore extends Mock
    implements GetAgoraTokenGetterStore {}

class MGetChannelIdGetterStore extends Mock
    implements GetChannelIdGetterStore {}

class MInstantiateAgoraSdkGetterStore extends Mock
    implements InstantiateAgoraSdkGetterStore {}

class MJoinCallGetterStore extends Mock implements JoinCallGetterStore {}

class MLeaveCallGetterStore extends Mock implements LeaveCallGetterStore {}

class MMuteLocalAudioStreamGetterStore extends Mock
    implements MuteLocalAudioStreamGetterStore {}

class MUnmuteLocalAudioStreamGetterStore extends Mock
    implements UnmuteLocalAudioStreamGetterStore {}

class MCheckIfUserHasTheQuestionStore extends Mock
    implements CheckIfUserHasTheQuestionStore {}

class MGetAgoraTokenStore extends Mock implements GetAgoraTokenStore {}

class MGetChannelIdStore extends Mock implements GetChannelIdStore {}

class MInstantiateAgoraSdkStore extends Mock
    implements InstantiateAgoraSdkStore {}

class MVoiceCallActionsStore extends Mock implements VoiceCallActionsStore {}

@GenerateMocks([
  MVoiceCallRemoteSourceImpl,
  MVoiceCallContract,
  MCheckIfUserHasTheQuestion,
  MGetAgoraToken,
  MGetChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudioStream,
  MUnmuteLocalAudioStream,
  MCheckIfUserHasTheQuestionGetterStore,
  MGetAgoraTokenGetterStore,
  MGetChannelIdGetterStore,
  MInstantiateAgoraSdkGetterStore,
  MJoinCallGetterStore,
  MLeaveCallGetterStore,
  MMuteLocalAudioStreamGetterStore,
  MUnmuteLocalAudioStreamGetterStore,
  MCheckIfUserHasTheQuestionStore,
  MGetAgoraTokenStore,
  MGetChannelIdStore,
  MInstantiateAgoraSdkStore,
  MVoiceCallActionsStore,
])
void main() {}
