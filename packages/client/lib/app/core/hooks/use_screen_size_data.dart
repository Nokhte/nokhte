import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';

ScreenSizeData useScreenSizeData() {
  final context = useContext(),
      width = MediaQuery.of(context).size.width,
      height = MediaQuery.of(context).size.height,
      padding = MediaQuery.of(context).padding;

  return ScreenSizeData(
    height: height,
    width: width,
    padding: padding,
  );
}
