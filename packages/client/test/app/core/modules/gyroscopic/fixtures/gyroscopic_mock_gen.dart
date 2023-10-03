import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/modules/gyroscopic/data/data.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class MGyroscopicRemoteSource extends Mock implements GyroscopicRemoteSource {}

class MGyroscopicContract extends Mock implements GyroscopicContract {}

@GenerateMocks([
  MGyroscopicContract,
  MGyroscopicRemoteSource,
])
void main() {}
