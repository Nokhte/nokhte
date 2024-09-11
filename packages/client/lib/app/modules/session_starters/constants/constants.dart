// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

mixin SessionStarterConstants {
  static const module = '/session_starters';

  static const relativeSessionStarterEntry = '/session_starter_entry';
  static const relativeSessionStarter = '/session_starter';

  static const sessionStarterEntry = '$module$relativeSessionStarterEntry';
  static const sessionStarter = '$module$relativeSessionStarter';

  static const blueGrad = [
    Color(0xFF50F3F3),
    Color(0xFF509DF3),
    Color(0xFF5072F3)
  ];
  static const orangeGrad = [
    Color(0xFFFFBC78),
    Color(0xFFFFE6C4),
  ];

  static const QR_CODE_DATA = 'qrCodeData';

  static const inactiveQrCodeData =
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
}
