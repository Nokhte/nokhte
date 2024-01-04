// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'center_cross_nokhte_store.g.dart';

class CenterCrossNokhteStore = _CenterCrossNokhteStoreBase
    with _$CenterCrossNokhteStore;

abstract class _CenterCrossNokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _CenterCrossNokhteStoreBase() {
    setMovie(RestingCenterCrossMovie.movie);
  }
  @override
  List<Object> get props => [];
}
