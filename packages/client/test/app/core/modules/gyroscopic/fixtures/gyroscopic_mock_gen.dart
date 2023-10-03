import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class MGyroscopicContract extends Mock implements GyroscopicContract {}

@GenerateMocks([
  MGyroscopicContract,
])
void main() {}
