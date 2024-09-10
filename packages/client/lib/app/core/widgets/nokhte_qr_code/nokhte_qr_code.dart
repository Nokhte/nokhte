// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
export 'nokhte_qr_code.dart';
export 'nokhte_qr_code_store.dart';

class NokhteQrCode extends HookWidget {
  final NokhteQrCodeStore store;
  const NokhteQrCode({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final width = useFullScreenSize().width;
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: Center(
          child: QrImageView(
            data: store.qrCodeData,
            size: width * .5,
            dataModuleStyle: const QrDataModuleStyle(
              color: Colors.white,
              dataModuleShape: QrDataModuleShape.square,
            ),
            eyeStyle: const QrEyeStyle(
              color: Colors.white,
              eyeShape: QrEyeShape.square,
            ),
          ),
        ),
      ),
    );
  }
}
