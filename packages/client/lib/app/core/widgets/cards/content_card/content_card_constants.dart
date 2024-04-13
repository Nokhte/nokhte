import 'package:flutter/material.dart';

mixin ContentCardConstants {
  final RegExp emojiRegexp = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  final blueGrad = const LinearGradient(
    colors: [
      Color(0xFF1F5BD0),
      Color(0xFF1FB0D0),
    ],
  );
}
