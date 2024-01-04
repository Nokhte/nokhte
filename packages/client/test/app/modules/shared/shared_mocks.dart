import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

@GenerateNiceMocks([
  MockSpec<WifiDisconnectOverlayStore>(),
  MockSpec<BeachWavesStore>(),
  MockSpec<CrossStore>(),
  MockSpec<TimeAlignmentModelCoordinator>(),
  MockSpec<CircleExplanationModelCoordinator>(),
  MockSpec<SmartTextStore>(),
  MockSpec<TrailingTextStore>(),
  MockSpec<NokhteBlurStore>(),
  MockSpec<NokhteStore>(),
  MockSpec<TapDetector>(),
])
void main() {}
