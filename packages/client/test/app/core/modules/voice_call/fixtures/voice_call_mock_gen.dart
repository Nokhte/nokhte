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

class MFetchAgoraToken extends Mock implements FetchAgoraToken {}

class MFetchChannelId extends Mock implements FetchChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudioStream extends Mock implements MuteLocalAudioStream {}

class MUnmuteLocalAudioStream extends Mock implements UnmuteLocalAudioStream {}

class MCheckIfUserHasTheQuestionGetterStore extends Mock
    implements CheckIfUserHasTheQuestionGetterStore {}

class MFetchAgoraTokenGetterStore extends Mock
    implements FetchAgoraTokenGetterStore {}

class MFetchChannelIdGetterStore extends Mock
    implements FetchChannelIdGetterStore {}

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

class MFetchAgoraTokenStore extends Mock implements FetchAgoraTokenStore {}

class MFetchChannelIdStore extends Mock implements FetchChannelIdStore {}

class MInstantiateAgoraSdkStore extends Mock
    implements InstantiateAgoraSdkStore {}

class MVoiceCallActionsStore extends Mock implements VoiceCallActionsStore {}

@GenerateMocks([
  MVoiceCallRemoteSourceImpl,
  MVoiceCallContract,
  MCheckIfUserHasTheQuestion,
  MFetchAgoraToken,
  MFetchChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudioStream,
  MUnmuteLocalAudioStream,
  MCheckIfUserHasTheQuestionGetterStore,
  MFetchAgoraTokenGetterStore,
  MFetchChannelIdGetterStore,
  MInstantiateAgoraSdkGetterStore,
  MJoinCallGetterStore,
  MLeaveCallGetterStore,
  MMuteLocalAudioStreamGetterStore,
  MUnmuteLocalAudioStreamGetterStore,
  MCheckIfUserHasTheQuestionStore,
  MFetchAgoraTokenStore,
  MFetchChannelIdStore,
  MInstantiateAgoraSdkStore,
  MVoiceCallActionsStore,
])
void main() {}
