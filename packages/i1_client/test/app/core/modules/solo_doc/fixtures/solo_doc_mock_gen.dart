// ignore_for_file: must_be_immutable

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class MSoloDocRemoteSource extends Mock implements SoloDocRemoteSource {}

class MSoloDocContract extends Mock implements SoloDocContract {}

class MCreateSoloDoc extends Mock implements CreateSoloDoc {}

class MGetSoloDoc extends Mock implements GetSoloDoc {}

class MSealSoloDoc extends Mock implements SealSoloDoc {}

class MShareSoloDoc extends Mock implements ShareSoloDoc {}

class MSubmitSoloDoc extends Mock implements SubmitSoloDoc {}

@GenerateMocks([
  MSoloDocRemoteSource,
  MSoloDocContract,
  MCreateSoloDoc,
  MGetSoloDoc,
  MSealSoloDoc,
  MShareSoloDoc,
  MSubmitSoloDoc,
])
void main() {}
