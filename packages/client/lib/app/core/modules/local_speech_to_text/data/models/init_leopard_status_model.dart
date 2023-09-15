import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class InitLeopardStatusModel extends InitLeopardStatusEntity {
  const InitLeopardStatusModel({required super.isInitialized});

  static InitLeopardStatusModel fromRemoteSource(List res) {
    if (res.isEmpty) {
      return const InitLeopardStatusModel(isInitialized: false);
    } else {
      return const InitLeopardStatusModel(isInitialized: true);
    }
  }
}
