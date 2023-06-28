import 'package:flutter/foundation.dart';

// one thing I'm thinking about is to

typedef K = Keys;

class Keys {
  const Keys();

  static const signInWithAppleButton = Key('signInWithAppleButton');
  static const signInWithGoogleButton = Key('signInWithGoogleButton');
  static const signOutButton = Key('signOutButton');
}
