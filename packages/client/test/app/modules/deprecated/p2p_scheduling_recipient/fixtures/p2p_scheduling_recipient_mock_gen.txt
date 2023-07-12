// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/contracts/p2p_scheduling_recipient_contract.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/data/contracts/p2p_scheduling_recipient_contract_impl.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/data/sources/p2p_scheduling_recipient_remote_source.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/domain/logic/respond_to_scheduling_request.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/getters/respond_to_scheduling_request_getter_store.dart';
import 'package:primala/app/modules/p2p_scheduling_recipient/presentation/mobx/main/respond_to_scheduling_request_store.dart';

class MP2PSchedulingRecipientRemoteSourceImpl extends Mock
    implements P2PSchedulingRecipientRemoteSourceImpl {}

class MP2PSchedulingRecipientContract extends Mock
    implements P2PSchedulingRecipientContract {}

class MP2PSchedulingRecipientContractImpl extends Mock
    implements P2PSchedulingRecipientContractImpl {}

class MRespondToSchedulingRequest extends Mock
    implements RespondToSchedulingRequest {}

class MRespondToSchedulingRequestGetterStore extends Mock
    implements RespondToSchedulingRequestGetterStore {}

class MRespondToSchedulingRequestStore extends Mock
    implements RespondToSchedulingRequestStore {}

@GenerateMocks([
  MP2PSchedulingRecipientContract,
  MRespondToSchedulingRequest,
  MP2PSchedulingRecipientContractImpl,
  MP2PSchedulingRecipientRemoteSourceImpl,
  MRespondToSchedulingRequestGetterStore,
  MRespondToSchedulingRequestStore,
])
void main() {}
