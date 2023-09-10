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

class MGetCollaboratorDelta extends Mock implements GetCollaboratorDelta {}

class MCreateCollaborativeDoc extends Mock implements CreateCollaborativeDoc {}

class MGetCollaboratorPresence extends Mock
    implements GetCollaboratorPresence {}

class MGetCollaborativeDocContentGetterStore extends Mock
    implements GetCollaborativeDocContentGetterStore {}

class MCreateCollaborativeDocGetterStore extends Mock
    implements CreateCollaborativeDocGetterStore {}

class MGetCollaboratorDeltaGetterStore extends Mock
    implements GetCollaboratorDeltaGetterStore {}

class MGetCollaboratorPresenceGetterStore extends Mock
    implements GetCollaboratorPresenceGetterStore {}

@GenerateMocks([
  MCollaborativeDocRemoteSource,
  MCollaborativeDocContract,
  MGetCollaborativeDocContent,
  MGetCollaboratorDelta,
  MCreateCollaborativeDoc,
  MGetCollaboratorPresence,
  MGetCollaborativeDocContentGetterStore,
  MCreateCollaborativeDocGetterStore,
  MGetCollaboratorDeltaGetterStore,
  MGetCollaboratorPresenceGetterStore,
])
void main() {}
