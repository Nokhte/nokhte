import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

@GenerateNiceMocks([
  MockSpec<WifiDisconnectOverlayStore>(),
  MockSpec<BeachWavesStore>(),
  MockSpec<GestureCrossStore>(),
  MockSpec<TimeAlignmentModelCoordinator>(),
  MockSpec<CircleExplanationModelCoordinator>(),
  MockSpec<SmartTextStore>(),
  MockSpec<GetUserInfoStore>(),
  MockSpec<TrailingTextStore>(),
  MockSpec<NokhteBlurStore>(),
  MockSpec<NokhteStore>(),
  MockSpec<TapDetector>(),
])
void main() {}
