// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'init_agora_sdk_store.g.dart';

class InitAgoraSdkStore = _InitAgoraSdkStoreBase with _$InitAgoraSdkStore;

abstract class _InitAgoraSdkStoreBase
    extends BaseMobxDBStore<NoParams, RtcEngine> with Store {
  @observable
  RtcEngine rtcEngine = createAgoraRtcEngine();

  final InitAgoraSdk logic;
  _InitAgoraSdkStoreBase({required this.logic});

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    rtcEngine = await logic(params);
    state = StoreState.loaded;
  }
}
