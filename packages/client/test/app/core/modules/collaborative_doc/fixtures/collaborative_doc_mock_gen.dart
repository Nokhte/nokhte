// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/sources/collaborative_doc_remote_source.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';

class MCollaborativeDocRemoteSource extends Mock
    implements CollaborativeDocRemoteSource {}

class MCollaborativeDocContract extends Mock
    implements CollaborativeDocContract {}

class MGetCollaborativeDocContent extends Mock
    implements GetCollaborativeDocContent {}

class MGetCollaboratorDocInfo extends Mock implements GetCollaboratorDocInfo {}

class MCreateCollaborativeDoc extends Mock implements CreateCollaborativeDoc {}

class MUpdateCollaborativeDoc extends Mock implements UpdateCollaborativeDoc {}

class MUpdateUserDelta extends Mock implements UpdateUserDelta {}

class MUpdateUserPresence extends Mock implements UpdateUserPresence {}

class MUpdateUserDeltaGetterStore extends Mock
    implements UpdateUserDeltaGetterStore {}

class MUpdateUserPresenceGetterStore extends Mock
    implements UpdateUserPresenceGetterStore {}

class MGetCollaborativeDocContentGetterStore extends Mock
    implements GetCollaborativeDocContentGetterStore {}

class MUpdateCollaborativeDocGetterStore extends Mock
    implements UpdateCollaborativeDocGetterStore {}

class MCreateCollaborativeDocGetterStore extends Mock
    implements CreateCollaborativeDocGetterStore {}

class MGetCollaboratorDocInfoGetterStore extends Mock
    implements GetCollaboratorDocInfoGetterStore {}

@GenerateMocks([
  MCollaborativeDocRemoteSource,
  MCollaborativeDocContract,
  MGetCollaborativeDocContent,
  MGetCollaboratorDocInfo,
  MUpdateCollaborativeDoc,
  MCreateCollaborativeDoc,
  MUpdateUserDelta,
  MUpdateUserPresence,
  MUpdateUserDeltaGetterStore,
  MUpdateUserPresenceGetterStore,
  MGetCollaborativeDocContentGetterStore,
  MUpdateCollaborativeDocGetterStore,
  MCreateCollaborativeDocGetterStore,
  MGetCollaboratorDocInfoGetterStore,
])
void main() {}
