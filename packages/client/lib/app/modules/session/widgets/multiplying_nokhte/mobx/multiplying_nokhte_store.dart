// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:simple_animations/simple_animations.dart';
part 'multiplying_nokhte_store.g.dart';

class MultiplyingNokhteStore = _MultiplyingNokhteStoreBase
    with _$MultiplyingNokhteStore;

abstract class _MultiplyingNokhteStoreBase
    extends BaseWidgetStore<MultiplyingNokhteMovieParams> with Store {
  _MultiplyingNokhteStoreBase() {
    setMovie(ShowSingleNokhte.getMovie());
  }

  @observable
  MultiplyingNokhteMovieModes movieMode =
      MultiplyingNokhteMovieModes.singleToPair;

  @observable
  ObservableList<String> symbols = ObservableList.of(List.filled(4, '\$'));

  @action
  setSymbols(List<String> list) => symbols = ObservableList.of(list);

  @override
  @action
  initMovie(params) {
    setMovieStatus(MovieStatus.inProgress);
    movieMode = params.movieMode;
    switch (params.movieMode) {
      case MultiplyingNokhteMovieModes.chooseCancel:
        setMovie(ChooseCancelMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.chooseMonetization:
        setMovie(ChooseMonetizationMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.singleToCrossroad:
        setMovie(SingleNokhteToCrossroadMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.singleToPair:
        setMovie(SingleNokhteToPairMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.singleToQuintuplet:
        setMovie(SingleNokhteToQuintupletMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.singleToTrio:
        setMovie(SingleNokhteToTrioMovie.getMovie(
          reverse: params.reverse,
        ));
      case MultiplyingNokhteMovieModes.showSingleNokhte:
        setMovie(ShowSingleNokhte.getMovie());
    }
    setControl(Control.playFromStart);
  }
}
