// * Testing & Mocking Libs
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class MP2PPurposeSessionContract extends Mock
    implements P2PPurposeSessionContract {}

@GenerateMocks([
  MP2PPurposeSessionContract,
])
void main() {}
