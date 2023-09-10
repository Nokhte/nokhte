// * Testing & Mocking Libs
// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/sources/collaborative_doc_remote_source.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/mobx/mobx.dart';

// remote sources

class MCollaborativeDocRemoteSource extends Mock
    implements CollaborativeDocRemoteSource {}

// contracts

class MCollaborativeDocContract extends Mock
    implements CollaborativeDocContract {}

// collaborative doc logic

class MGetCollaborativeDocContent extends Mock
    implements GetCollaborativeDocContent {}

class MGetCollaboratorDelta extends Mock implements GetCollaboratorDelta {}

class MGetCollaboratorPresence extends Mock
    implements GetCollaboratorPresence {}

// collaborative doc getter stores

class MGetCollaborativeDocContentGetterStore extends Mock
    implements GetCollaborativeDocContentGetterStore {}

class MGetCollaboratorDeltaGetterStore extends Mock
    implements GetCollaboratorDeltaGetterStore {}

class MGetCollaboratorPresenceGetterStore extends Mock
    implements GetCollaboratorPresenceGetterStore {}

@GenerateMocks([
  MCollaborativeDocRemoteSource,
  MCollaborativeDocContract,
  MGetCollaborativeDocContent,
  MGetCollaboratorDelta,
  MGetCollaboratorPresence,
  MGetCollaborativeDocContentGetterStore,
  MGetCollaboratorDeltaGetterStore,
  MGetCollaboratorPresenceGetterStore,
])
void main() {}
