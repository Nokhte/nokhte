import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StorageModule extends Module {
  @override
  void binds(i) {
    //
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => const Scaffold(
        body: Center(
          child: Text("Storage"),
        ),
      ),
    );
  }
}
