// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';

class MockMP2PCollaboratorPoolContract extends Mock
    implements P2PCollaboratorPoolContract {}

@GenerateMocks([
  MockMP2PCollaboratorPoolContract,
])
void main() {}
