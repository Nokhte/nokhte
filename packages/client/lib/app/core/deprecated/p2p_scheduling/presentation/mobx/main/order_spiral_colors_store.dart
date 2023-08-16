// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/deprecated/p2p_scheduling/presentation/mobx/getters/order_spiral_colors_getter_store.dart';
// * Mobx Codegen Inclusion
part 'order_spiral_colors_store.g.dart';

class OrderSpiralColorsStore = _OrderSpiralColorsStoreBase
    with _$OrderSpiralColorsStore;

abstract class _OrderSpiralColorsStoreBase extends Equatable with Store {
  final OrderSpiralColorsGetterStore orderSpiralColorsGetterStore;

  _OrderSpiralColorsStoreBase({
    required this.orderSpiralColorsGetterStore,
  });

  @observable
  List<String> orderedTimes = [];

  @action
  void call(NoParams params) {
    orderedTimes = orderSpiralColorsGetterStore(
      params,
    ).orderedTimesArr;
  }

  @override
  List<Object> get props => [];
}
