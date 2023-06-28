// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_ordered_times_entity.dart';
import 'package:primala/app/core/p2p_scheduling/domain/logic/order_spiral_colors.dart';
// * Mobx Codegen Inclusion
part 'order_spiral_colors_getter_store.g.dart';

class OrderSpiralColorsGetterStore = _OrderSpiralColorsGetterStoreBase
    with _$OrderSpiralColorsGetterStore;

abstract class _OrderSpiralColorsGetterStoreBase extends Equatable with Store {
  final OrderSpiralColors orderSpiralColors;

  _OrderSpiralColorsGetterStoreBase({required this.orderSpiralColors});

  P2PSchedulingOrderedTimesEntity call(NoParams params) {
    return orderSpiralColors(params);
  }

  @override
  List<Object> get props => [];
}
