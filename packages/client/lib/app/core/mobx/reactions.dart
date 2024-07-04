import 'package:mobx/mobx.dart';

mixin Reactions {
  List<ReactionDisposer> disposers = [];

  dispose() {
    for (var disposer in disposers) {
      disposer.call();
    }
  }
}
