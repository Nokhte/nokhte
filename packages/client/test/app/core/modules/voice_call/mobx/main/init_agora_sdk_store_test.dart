import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockInitAgoraSdk mockLogic;
  late InitAgoraSdkStore instantiateAgoraSdkStore;
  final tParams = NoParams();

  setUp(() {
    mockLogic = MockInitAgoraSdk();
    instantiateAgoraSdkStore = InitAgoraSdkStore(
      logic: mockLogic,
    );
  });

  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      final tEngine = createAgoraRtcEngine();
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => tEngine,
      );
      await instantiateAgoraSdkStore(tParams);
      expect(
        instantiateAgoraSdkStore.rtcEngine,
        tEngine,
      );
      expect(instantiateAgoraSdkStore.errorMessage, "");
    });
  });
}
