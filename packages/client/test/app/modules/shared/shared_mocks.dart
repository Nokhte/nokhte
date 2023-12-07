import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/widgets/nokhte/nokhte.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

@GenerateNiceMocks([
  MockSpec<BeachWavesStore>(),
  MockSpec<SmartTextStore>(),
  MockSpec<SwipeDetector>(),
  MockSpec<NokhteStore>(),
  MockSpec<TapDetector>(),
])
void main() {}
