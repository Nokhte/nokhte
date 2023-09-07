// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';

class MP2PPurposeSessionVoiceCallRemoteSourceImpl extends Mock
    implements P2PPurposeSessionVoiceCallRemoteSourceImpl {}

class MP2PPurposeSessionVoiceCallContract extends Mock
    implements P2PPurposeSessionVoiceCallContract {}

class MP2PPurposeSessionSoloDocContract extends Mock
    implements P2PPurposeSessionSoloDocContract {}

class MCreateSoloDoc extends Mock implements CreateSoloDoc {}

class MGetSoloDoc extends Mock implements GetSoloDoc {}

class MSealSoloDoc extends Mock implements SealSoloDoc {}

class MShareSoloDoc extends Mock implements ShareSoloDoc {}

class MSubmitSoloDoc extends Mock implements SubmitSoloDoc {}

class MCheckIfUserHasTheQuestion extends Mock
    implements CheckIfUserHasTheQuestion {}

class MFetchAgoraToken extends Mock implements FetchAgoraToken {}

class MFetchChannelId extends Mock implements FetchChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudioStream extends Mock implements MuteLocalAudioStream {}

class MUnmuteLocalAudioStream extends Mock implements UnmuteLocalAudioStream {}

class MCreateSoloDocGetterStore extends Mock
    implements CreateSoloDocGetterStore {}

class MCreateSoloDocStore extends Mock implements CreateSoloDocStore {}

class MGetSoloDocGetterStore extends Mock implements GetSoloDocGetterStore {}

class MGetSoloDocStore extends Mock implements GetSoloDocStore {}

class MSealSoloDocGetterStore extends Mock implements SealSoloDocGetterStore {}

class MSealSoloDocStore extends Mock implements SealSoloDocStore {}

class MShareSoloDocGetterStore extends Mock
    implements ShareSoloDocGetterStore {}

class MShareSoloDocStore extends Mock implements ShareSoloDocStore {}

class MSubmitSoloDocGetterStore extends Mock
    implements SubmitSoloDocGetterStore {}

class MSubmitSoloDocStore extends Mock implements SubmitSoloDocStore {}
// voice stores

class MCheckIfUserHasTheQuestionGetterStore extends Mock
    implements CheckIfUserHasTheQuestionGetterStore {}

class MCheckIfUserHasTheQuestionStore extends Mock
    implements CheckIfUserHasTheQuestionStore {}

class MFetchAgoraTokenGetterStore extends Mock
    implements FetchAgoraTokenGetterStore {}

class MFetchAgoraTokenStore extends Mock implements FetchAgoraTokenStore {}

class MFetchChannelIdGetterStore extends Mock
    implements FetchChannelIdGetterStore {}

class MFetchChannelIdStore extends Mock implements FetchChannelIdStore {}

class MInstantiateAgoraSdkGetterStore extends Mock
    implements InstantiateAgoraSdkGetterStore {}

class MInstantiateAgoraSdkStore extends Mock
    implements InstantiateAgoraSdkStore {}

class MJoinCallGetterStore extends Mock implements JoinCallGetterStore {}

class MLeaveCallGetterStore extends Mock implements LeaveCallGetterStore {}

class MMuteLocalAudioStreamGetterStore extends Mock
    implements MuteLocalAudioStreamGetterStore {}

class MUnmuteLocalAudioStreamGetterStore extends Mock
    implements UnmuteLocalAudioStreamGetterStore {}

class MVoiceCallActions extends Mock implements VoiceCallActionsStore {}

@GenerateMocks([
  MP2PPurposeSessionVoiceCallRemoteSourceImpl,
  MP2PPurposeSessionVoiceCallContract,
  MP2PPurposeSessionSoloDocContract,
  MCreateSoloDoc,
  MGetSoloDoc,
  MSealSoloDoc,
  MShareSoloDoc,
  MSubmitSoloDoc,
  MCheckIfUserHasTheQuestion,
  MFetchAgoraToken,
  MFetchChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudioStream,
  MUnmuteLocalAudioStream,
  MCreateSoloDocGetterStore,
  MCreateSoloDocStore,
  MGetSoloDocGetterStore,
  MGetSoloDocStore,
  MSealSoloDocGetterStore,
  MSealSoloDocStore,
  MShareSoloDocGetterStore,
  MShareSoloDocStore,
  MSubmitSoloDocGetterStore,
  MSubmitSoloDocStore,
  MCheckIfUserHasTheQuestionGetterStore,
  MCheckIfUserHasTheQuestionStore,
  MFetchAgoraTokenGetterStore,
  MFetchAgoraTokenStore,
  MFetchChannelIdGetterStore,
  MFetchChannelIdStore,
  MInstantiateAgoraSdkGetterStore,
  MInstantiateAgoraSdkStore,
  MJoinCallGetterStore,
  MLeaveCallGetterStore,
  MMuteLocalAudioStreamGetterStore,
  MUnmuteLocalAudioStreamGetterStore,
  MVoiceCallActions,
])
void main() {}
