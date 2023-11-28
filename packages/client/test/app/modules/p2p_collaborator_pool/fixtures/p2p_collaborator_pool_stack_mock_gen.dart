// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';

class MP2PCollaboratorPoolRemoteSourceImpl extends Mock
    implements P2PCollaboratorPoolRemoteSourceImpl {}

class MP2PCollaboratorPoolContract extends Mock
    implements P2PCollaboratorPoolContract {}

class MCancelCollaboratorStream extends Mock
    implements CancelCollaboratorStream {}

class MEnterCollaboratorPool extends Mock implements EnterCollaboratorPool {}

class MExitCollaboratorPool extends Mock implements ExitCollaboratorPool {}

class MGetCollaboratorSearchStatus extends Mock
    implements GetCollaboratorSearchStatus {}

class MValidateQuery extends Mock implements ValidateQuery {}

@GenerateMocks([
  MP2PCollaboratorPoolRemoteSourceImpl,
  MP2PCollaboratorPoolContract,
  MCancelCollaboratorStream,
  MEnterCollaboratorPool,
  MExitCollaboratorPool,
  MGetCollaboratorSearchStatus,
  MValidateQuery,
])
@GenerateNiceMocks([
  MockSpec<P2PCollaboratorPoolRemoteSource>(),
])
void main() {}
