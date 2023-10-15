import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/logic/return_date_or_time_array.dart';
import 'package:primala/app/core/widgets/widgets.dart';

class ConveyerBeltTextWidgetModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<ReturnDateOrTimeArray>(
          (i) => ReturnDateOrTimeArray(),
          export: true,
        ),
        Bind.singleton<ConveyerBeltTextStore>(
          (i) => ConveyerBeltTextStore(
            logic: i<ReturnDateOrTimeArray>(),
            dateOrTimeParam: DateOrTime.date,
          ),
          export: true,
        ),
      ];
}
