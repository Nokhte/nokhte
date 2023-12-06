import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

@GenerateNiceMocks([
  MockSpec<BeachWavesStore>(),
  MockSpec<SmartTextStore>(),
  MockSpec<SwipeDetector>(),
  MockSpec<TapDetector>(),
])
void main() {}
