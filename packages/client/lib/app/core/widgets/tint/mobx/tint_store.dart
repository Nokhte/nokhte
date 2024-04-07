// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'tint_store.g.dart';

class TintStore = _TintStoreBase with _$TintStore;

abstract class _TintStoreBase extends BaseCustomAnimatedWidgetStore with Store {
  _TintStoreBase() {
    setMovie(TintMovie.movie);
  }
}
