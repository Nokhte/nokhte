// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

mixin SessionStarterConstants {
  static const module = '/session_starters';

  static const relativeSessionStarterEntry = '/session_starter_entry';
  static const relativeSessionStarterExit = '/session_starter_exit';
  static const relativeSessionStarter = '/session_starter';
  static const relativeSessionStarterInstructions =
      '/session_starter_instructions';
  static const relativeSessionInstructionsPicker =
      '/session_instructions_picker';
  static const relativeSessionJoiner = '/session_joiner';
  static const relativeSessionJoinerInstructions =
      '/session_joiner_instructions';

  static const sessionStarterEntry = '$module$relativeSessionStarterEntry';
  static const sessionStarterExit = '$module$relativeSessionStarterExit';
  static const sessionStarter = '$module$relativeSessionStarter';
  static const sessionStarterInstructions =
      '$module$relativeSessionStarterInstructions';
  static const sessionInstructionsPicker =
      '$module$relativeSessionInstructionsPicker';
  static const sessionJoiner = '$module$relativeSessionJoiner';
  static const sessionJoinerInstructions =
      '$module$relativeSessionJoinerInstructions';

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
}
