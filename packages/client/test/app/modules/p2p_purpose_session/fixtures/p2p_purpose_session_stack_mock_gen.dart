// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/voice_call/data/data.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';

// remote sources
class MP2PPurposeSessionSoloDocRemoteSource extends Mock
    implements P2PPurposeSessionSoloDocRemoteSource {}

class MP2PPurposeSessionVoiceCallRemoteSourceImpl extends Mock
    implements P2PPurposeSessionVoiceCallRemoteSourceImpl {}

// contracts
class MP2PPurposeSessionVoiceCallContract extends Mock
    implements P2PPurposeSessionVoiceCallContract {}

class MP2PPurposeSessionSoloDocContract extends Mock
    implements P2PPurposeSessionSoloDocContract {}

class MP2PPurposeSessionCollaborativeDocContract extends Mock
    implements P2PPurposeSessionCollaborativeDocContract {}

// collaborative doc logic

class MGetCollaborativeDocContent extends Mock
    implements GetCollaborativeDocContent {}

class MGetCollaboratorDelta extends Mock implements GetCollaboratorDelta {}

class MGetCollaboratorPresence extends Mock
    implements GetCollaboratorPresence {}

// solo doc logic

class MCreateSoloDoc extends Mock implements CreateSoloDoc {}

class MGetSoloDoc extends Mock implements GetSoloDoc {}

class MSealSoloDoc extends Mock implements SealSoloDoc {}

class MShareSoloDoc extends Mock implements ShareSoloDoc {}

class MSubmitSoloDoc extends Mock implements SubmitSoloDoc {}

// voice call logic
class MCheckIfUserHasTheQuestion extends Mock
    implements CheckIfUserHasTheQuestion {}

class MFetchAgoraToken extends Mock implements FetchAgoraToken {}

class MFetchChannelId extends Mock implements FetchChannelId {}

class MInstantiateAgoraSdk extends Mock implements InstantiateAgoraSdk {}

class MJoinCall extends Mock implements JoinCall {}

class MLeaveCall extends Mock implements LeaveCall {}

class MMuteLocalAudioStream extends Mock implements MuteLocalAudioStream {}

class MUnmuteLocalAudioStream extends Mock implements UnmuteLocalAudioStream {}

// collaborative doc getter stores

class MGetCollaborativeDocContentGetterStore extends Mock
    implements GetCollaborativeDocContentGetterStore {}

class MGetCollaboratorDeltaGetterStore extends Mock
    implements GetCollaboratorDeltaGetterStore {}

class MGetCollaboratorPresenceGetterStore extends Mock
    implements GetCollaboratorPresenceGetterStore {}

// solo doc getter stores
class MCreateSoloDocGetterStore extends Mock
    implements CreateSoloDocGetterStore {}

class MGetSoloDocGetterStore extends Mock implements GetSoloDocGetterStore {}

class MSealSoloDocGetterStore extends Mock implements SealSoloDocGetterStore {}

class MShareSoloDocGetterStore extends Mock
    implements ShareSoloDocGetterStore {}

class MSubmitSoloDocGetterStore extends Mock
    implements SubmitSoloDocGetterStore {}
// solo doc stores

class MCreateSoloDocStore extends Mock implements CreateSoloDocStore {}

class MGetSoloDocStore extends Mock implements GetSoloDocStore {}

class MSealSoloDocStore extends Mock implements SealSoloDocStore {}

class MShareSoloDocStore extends Mock implements ShareSoloDocStore {}

class MSubmitSoloDocStore extends Mock implements SubmitSoloDocStore {}

// voice call getter stores
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

// voice call  stores
class MCheckIfUserHasTheQuestionStore extends Mock
    implements CheckIfUserHasTheQuestionStore {}

class MFetchAgoraTokenStore extends Mock implements FetchAgoraTokenStore {}

class MFetchChannelIdStore extends Mock implements FetchChannelIdStore {}

class MInstantiateAgoraSdkStore extends Mock
    implements InstantiateAgoraSdkStore {}

class MVoiceCallActionsStore extends Mock implements VoiceCallActionsStore {}

@GenerateMocks([
  /// % REMOTE SOURCES
  MP2PPurposeSessionSoloDocRemoteSource,
  MP2PPurposeSessionVoiceCallRemoteSourceImpl,
  // % CONTRACTS
  MP2PPurposeSessionVoiceCallContract,
  MP2PPurposeSessionCollaborativeDocContract,
  MP2PPurposeSessionSoloDocContract,
  // % Collaborative Doc Logic
  MGetCollaborativeDocContent,
  MGetCollaboratorDelta,
  MGetCollaboratorPresence,
  // % Solo Doc Logic
  MCreateSoloDoc,
  MGetSoloDoc,
  MSealSoloDoc,
  MShareSoloDoc,
  MSubmitSoloDoc,
  // % Voice Call Logic
  MCheckIfUserHasTheQuestion,
  MFetchAgoraToken,
  MFetchChannelId,
  MInstantiateAgoraSdk,
  MJoinCall,
  MLeaveCall,
  MMuteLocalAudioStream,
  MUnmuteLocalAudioStream,
  // % Solo Doc Getter Stores
  MCreateSoloDocGetterStore,
  MGetSoloDocGetterStore,
  MSealSoloDocGetterStore,
  MShareSoloDocGetterStore,
  MSubmitSoloDocGetterStore,
  // % Collaborative Doc Getter Stores
  MGetCollaborativeDocContentGetterStore,
  MGetCollaboratorDeltaGetterStore,
  MGetCollaboratorPresenceGetterStore,
  // % Voice Call Getter Stores
  MCheckIfUserHasTheQuestionGetterStore,
  MFetchAgoraTokenGetterStore,
  MFetchChannelIdGetterStore,
  MInstantiateAgoraSdkGetterStore,
  MJoinCallGetterStore,
  MLeaveCallGetterStore,
  MMuteLocalAudioStreamGetterStore,
  MUnmuteLocalAudioStreamGetterStore,
  // % Voice Call Stores
  MCheckIfUserHasTheQuestionStore,
  MFetchAgoraTokenStore,
  MFetchChannelIdStore,
  MInstantiateAgoraSdkStore,
  MVoiceCallActionsStore,
  // % Solo Doc Stores
  MCreateSoloDocStore,
  MGetSoloDocStore,
  MSealSoloDocStore,
  MShareSoloDocStore,
  MSubmitSoloDocStore,
  // % Collaborative Doc Stores
])
void main() {}
