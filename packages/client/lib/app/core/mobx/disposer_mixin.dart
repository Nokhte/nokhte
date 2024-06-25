import 'package:mobx/mobx.dart';

mixin Disposer {
  List<ReactionDisposer> disposers = [];

  deconstructor() {
    for (var disposer in disposers) {
      disposer.call();
    }
  }
}
