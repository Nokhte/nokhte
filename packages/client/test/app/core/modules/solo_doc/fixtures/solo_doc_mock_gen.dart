// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';

class MSoloDocRemoteSource extends Mock implements SoloDocRemoteSource {}

class MSoloDocContract extends Mock implements SoloDocContract {}

class MCreateSoloDoc extends Mock implements CreateSoloDoc {}

class MGetSoloDoc extends Mock implements GetSoloDoc {}

class MSealSoloDoc extends Mock implements SealSoloDoc {}

class MShareSoloDoc extends Mock implements ShareSoloDoc {}

class MSubmitSoloDoc extends Mock implements SubmitSoloDoc {}

class MCreateSoloDocGetterStore extends Mock
    implements CreateSoloDocGetterStore {}

class MGetSoloDocGetterStore extends Mock implements GetSoloDocGetterStore {}

class MSealSoloDocGetterStore extends Mock implements SealSoloDocGetterStore {}

class MShareSoloDocGetterStore extends Mock
    implements ShareSoloDocGetterStore {}

class MSubmitSoloDocGetterStore extends Mock
    implements SubmitSoloDocGetterStore {}

@GenerateMocks([
  MSoloDocRemoteSource,
  MSoloDocContract,
  MCreateSoloDoc,
  MGetSoloDoc,
  MSealSoloDoc,
  MShareSoloDoc,
  MSubmitSoloDoc,
  MCreateSoloDocGetterStore,
  MGetSoloDocGetterStore,
  MSealSoloDocGetterStore,
  MShareSoloDocGetterStore,
  MSubmitSoloDocGetterStore,
])
void main() {}
