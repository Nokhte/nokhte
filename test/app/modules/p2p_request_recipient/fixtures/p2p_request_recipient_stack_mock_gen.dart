// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/sources/p2p_request_recipient_remote_source.dart';
// contract
import 'package:primala/app/modules/p2p_request_recipient/domain/contracts/p2p_request_recipient_contract.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/load_the_requests.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/logic/respond_to_a_request.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/getters/load_the_requests_getter_store.dart';
import 'package:primala/app/modules/p2p_request_recipient/presentation/mobx/getters/respond_to_a_request_getter_store.dart';

class MP2PRequestRecipientRemoteSourceImpl extends Mock
    implements P2PRequestRecipientRemoteSourceImpl {}

class MP2PRequestRecipientRemoteSource extends Mock
    implements P2PRequestRecipientRemoteSource {}

class MP2PRequestRecipientContract extends Mock
    implements P2PRequestRecipientContract {}

class MRespondToARequest extends Mock implements RespondToARequest {}

class MLoadTheRequests extends Mock implements LoadTheRequests {}

class MLoadtheRequestsGetterStore extends Mock
    implements LoadTheRequestsGetterStore {}

class MRespondToARequestGetterStore extends Mock
    implements RespondToARequestGetterStore {}

@GenerateMocks([
  MP2PRequestRecipientContract,
  MP2PRequestRecipientRemoteSource,
  MRespondToARequest,
  MLoadTheRequests,
  MLoadtheRequestsGetterStore,
  MRespondToARequestGetterStore,
  MP2PRequestRecipientRemoteSourceImpl,
])
void main() {}
