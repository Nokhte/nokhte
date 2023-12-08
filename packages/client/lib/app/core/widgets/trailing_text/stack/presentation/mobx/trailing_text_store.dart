// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'trailing_text_store.g.dart';

class TrailingTextStore = _TrailingTextStoreBase with _$TrailingTextStore;

abstract class _TrailingTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
