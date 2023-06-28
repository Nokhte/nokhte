// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/contracts/p2p_scheduling_sender_contract.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/send_scheduling_request.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/send_scheduling_request_getter_store.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/data/sources/p2p_scheduling_sender_remote_source.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/send_scheduling_request_store.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/logic/confirm_scheduling_time.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/getters/confirm_scheduling_time_getter_store.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/presentation/mobx/main/confirm_scheduling_time_store.dart';

class MP2PSchedulingSenderRemoteSourceImpl extends Mock
    implements P2PSchedulingSenderRemoteSourceImpl {}

class MP2PSchedulingSenderRemoteSource extends Mock
    implements P2PSchedulingSenderRemoteSource {}

class MP2PSchedulingSenderContract extends Mock
    implements P2PSchedulingSenderContract {}

class MSendSchedulingRequest extends Mock implements SendSchedulingRequest {}

class MConfirmSchedulingTime extends Mock implements ConfirmSchedulingTime {}

class MSendSchedulingRequestGetterStore extends Mock
    implements SendSchedulingRequestGetterStore {}

class MConfirmSchedulingTimeGetterStore extends Mock
    implements ConfirmSchedulingTimeGetterStore {}

class MSendSchedulingRequestStore extends Mock
    implements SendSchedulingRequestStore {}

class MConfirmSchedulingTimeStore extends Mock
    implements ConfirmSchedulingTimeStore {}

@GenerateMocks([
  MP2PSchedulingSenderRemoteSourceImpl,
  MP2PSchedulingSenderRemoteSource,
  MP2PSchedulingSenderContract,
  MSendSchedulingRequest,
  MConfirmSchedulingTime,
  MSendSchedulingRequestGetterStore,
  MConfirmSchedulingTimeGetterStore,
  MSendSchedulingRequestStore,
  MConfirmSchedulingTimeStore,
])
void main() {}
