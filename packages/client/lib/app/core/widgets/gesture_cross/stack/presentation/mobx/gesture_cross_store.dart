// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/widgets/gesture_cross/gesture_cross.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends Equatable with Store {
  @observable
  MovieTween movie = CrossToCircle.movie;

  @observable
  Control control = Control.mirror;

  @observable
  bool showWidget = false;

  _GestureCrossStoreBase();

  @override
  List<Object> get props => [];
}
