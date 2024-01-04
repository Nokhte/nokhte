// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends Equatable with Store {
  final CrossStore cross;
  final GradientCrossNokhteStore gradientNokhte;

  _GestureCrossStoreBase({
    required this.cross,
    required this.gradientNokhte,
  });

  @override
  List<Object> get props => [];
}
