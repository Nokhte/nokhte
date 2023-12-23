// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'accompanying_text_store.g.dart';

class AccompanyingTextStore = _AccompanyingTextStoreBase
    with _$AccompanyingTextStore;

abstract class _AccompanyingTextStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
