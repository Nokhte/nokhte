// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/widgets/qr_scanner/movies/movies.dart';
import 'package:simple_animations/simple_animations.dart';
part 'qr_scanner_store.g.dart';

class QrScannerStore = _QrScannerStoreBase with _$QrScannerStore;

abstract class _QrScannerStoreBase extends BaseWidgetStore
    with Store, Reactions {
  final SmartTextStore smartText = SmartTextStore();
  _QrScannerStoreBase() {
    setMovie(OpacityMovies.fadeIn);
  }
  @observable
  late MobileScannerController controller =
      MobileScannerController(autoStart: false);

  @observable
  String mostRecentScannedUID = '';

  StreamSubscription<Object?>? subscription;

  @action
  constructor() async {
    setWidgetVisibility(false);
    subscription = controller.barcodes.listen(handleBarcode);
    smartText.setMessagesData(SessionStartersList.qrScanner);
    smartText.startRotatingText();
    await controller.start();
    Timer(Seconds.get(1), () {
      setWidgetVisibility(true);
      Timer(Seconds.get(1), () {
        setControl(Control.playFromStart);
      });
      // setControl(Control.playFromStart);
    });
    disposers.add(smartTextIndexReactor());
  }

  rotateText() {
    smartText.startRotatingText(isResuming: true);
  }

  resetText() {
    print("reset text");
    smartText.setWidgetVisibility(false);
    mostRecentScannedUID = '';
    Timer(Seconds.get(1), () {
      smartText.setCurrentIndex(3);
    });
  }

  smartTextIndexReactor() => reaction((p0) => smartText.currentIndex, (p0) {
        if (p0 == 3) {
          Timer(Seconds.get(1), () {
            smartText.reset();
            smartText.startRotatingText();
          });
        }
      });

  @action
  fadeOut() {
    setWidgetVisibility(false);
    setControl(Control.playReverseFromEnd);
  }

  handleBarcode(BarcodeCapture barcode) {
    mostRecentScannedUID = barcode.barcodes.last.rawValue!;
  }

  @action
  deconstructor() {
    dispose();
    unawaited(subscription?.cancel());
    subscription = null;
    unawaited(controller.dispose());
  }
}
