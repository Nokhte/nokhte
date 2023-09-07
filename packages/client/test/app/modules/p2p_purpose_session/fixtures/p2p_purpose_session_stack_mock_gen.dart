// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

class MP2PPurposeSessionVoiceCallRemoteSourceImpl extends Mock
    implements P2PPurposeSessionVoiceCallRemoteSourceImpl {}

class MP2PPurposeSessionVoiceCallContract extends Mock
    implements P2PPurposeSessionVoiceCallContract {}

class MCheckIfUserHasTheQuestion extends Mock
    implements CheckIfUserHasTheQuestion {}

class MFetchAgoraToken extends Mock implements FetchAgoraToken {}

class MFetchChannelId extends Mock implements FetchChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudioStream extends Mock implements MuteLocalAudioStream {}

class MUnmuteLocalAudioStream extends Mock implements UnmuteLocalAudioStream {}

@GenerateMocks([
  MP2PPurposeSessionVoiceCallRemoteSourceImpl,
  MP2PPurposeSessionVoiceCallContract,
  MCheckIfUserHasTheQuestion,
  MFetchAgoraToken,
  MFetchChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudioStream,
  MUnmuteLocalAudioStream,
])
void main() {}
