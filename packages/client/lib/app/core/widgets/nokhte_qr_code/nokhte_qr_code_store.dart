// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
part 'nokhte_qr_code_store.g.dart';

class NokhteQrCodeStore = _NokhteQrCodeStoreBase with _$NokhteQrCodeStore;

abstract class _NokhteQrCodeStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  String qrCodeData = "";

  @action
  setQrCodeData(String qrCodeDataParam) => qrCodeData = qrCodeDataParam;
}
