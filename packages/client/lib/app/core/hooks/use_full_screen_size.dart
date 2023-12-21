import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Size useFullScreenSize() {
  return MediaQuery.of(useContext()).size;
}
