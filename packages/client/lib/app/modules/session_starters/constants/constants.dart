mixin SessionStarterConstants {
  static const module = '/session_starters';

  static const relativeSessionStarterEntry = '/session_starter_entry';
  static const relativeSessionStarterExit = '/session_starter_exit';
  static const relativeSessionStarter = '/session_starter';
  static const relativeSessionStarterInstructions =
      '/session_starter_instructions';

  static const sessionStarterEntry = '$module$relativeSessionStarterEntry';
  static const sessionStarterExit = '$module$relativeSessionStarterExit';
  static const sessionStarter = '$module$relativeSessionStarter';
  static const sessionStarterInstructions =
      '$module$relativeSessionStarterInstructions';
}
