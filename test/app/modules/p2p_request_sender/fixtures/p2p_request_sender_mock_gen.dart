// ignore_for_file: must_be_immutable
// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_request_sender/data/sources/p2p_request_sender_remote_source.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/contracts/p2p_request_sender_contract.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/send_a_request.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/getters/validate_request_getter_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/getters/send_a_request_getter_store.dart';

class MP2PRequestSenderRemoteSourceImpl extends Mock
    implements P2PRequestSenderRemoteSourceImpl {}

class MP2PRequestSenderRemoteSource extends Mock
    implements P2PRequestSenderRemoteSource {}

class MP2PRequestSenderContract extends Mock
    implements P2PRequestSenderContract {}

class MValidateRequest extends Mock implements ValidateRequest {}

class MSendARequest extends Mock implements SendARequest {}

class MValidateRequestGetterStore extends Mock
    implements ValidateRequestGetterStore {}

class MSendARequestGetterStore extends Mock
    implements SendARequestGetterStore {}

@GenerateMocks([
  MP2PRequestSenderContract,
  MP2PRequestSenderRemoteSource,
  MValidateRequest,
  MSendARequest,
  MValidateRequestGetterStore,
  MSendARequestGetterStore,
  MP2PRequestSenderRemoteSourceImpl,
])
void main() {}
