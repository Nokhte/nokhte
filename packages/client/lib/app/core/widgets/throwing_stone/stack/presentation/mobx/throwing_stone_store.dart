// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'throwing_stone_store.g.dart';

class ThrowingStoneStore = _ThrowingStoneStoreBase with _$ThrowingStoneStore;

abstract class _ThrowingStoneStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {}
