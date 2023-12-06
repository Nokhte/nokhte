// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/sources/collaborative_doc_remote_source.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

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

@GenerateMocks([
  MCollaborativeDocRemoteSource,
  MCollaborativeDocContract,
  MGetCollaborativeDocContent,
  MGetCollaboratorDocInfo,
  MUpdateCollaborativeDoc,
  MCreateCollaborativeDoc,
  MUpdateUserDelta,
  MUpdateUserPresence,
])
void main() {}
