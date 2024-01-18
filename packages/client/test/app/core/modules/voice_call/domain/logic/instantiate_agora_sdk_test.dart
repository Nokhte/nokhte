import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockVoiceCallContract mockContract;
  late InitAgoraSdk logic;

  setUp(() {
    mockContract = MockVoiceCallContract();
    logic = InitAgoraSdk(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.initAgoraSdk(NoParams())).thenAnswer(
      (_) async => createAgoraRtcEngine(),
    );

    final result = await logic(NoParams());

    expect(result, createAgoraRtcEngine());
    verify(mockContract.initAgoraSdk(NoParams()));
    verifyNoMoreInteractions(mockContract);
  });
}
