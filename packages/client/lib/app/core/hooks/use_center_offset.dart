import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Offset useCenterOffset() {
  final context = useContext();
  final centerX = MediaQuery.of(context).size.width / 2;
  final centerY = MediaQuery.of(context).size.height / 2;
  return Offset(centerX, centerY);
}
