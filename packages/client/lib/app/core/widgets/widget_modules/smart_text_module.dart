import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SmartTextModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<SmartTextStore>(
      () => SmartTextStore(),
    );
  }
}
