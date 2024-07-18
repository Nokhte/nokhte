import 'package:flutter_modular/flutter_modular.dart';

mixin RoutingArgs {
  bool get hasReceivedRoutingArgs => Modular.args.data.toString() != 'null';
}
