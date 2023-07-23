/// app_widget.dart
///
/// Author: Sonny Vesali
///
/// This file defines the main application widget for the Primala Flutter app.
/// The [AppWidget] class sets up the app's theme and routing using
/// `flutter_modular` and `flutter_platform_widgets`.
///
/// Widget Overview:
/// - [AppWidget]: Root widget and main entry point of the user interface.
///
/// Widget Description:
/// The [AppWidget] class is a StatelessWidget configuring the app's theme and
/// routing.
///
/// 1. The [PlatformProvider] sets platform-specific behavior for the app.
/// 2. The [PlatformTheme] sets the light theme for both Cupertino (iOS) and
///    Material (Android).
/// 3. [PlatformApp.router] creates the app's main navigation mechanism using
///    `flutter_modular`.
/// 4. The `title` sets the app's title for display.
/// 5. The `localizationsDelegates` handle localization and
///    internationalization.
/// 6. The `routeInformationParser` and `routerDelegate` enable modular-based
///    routing and navigation.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformTheme(
        cupertinoLightTheme: const CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(53, 53, 53, 1.0),
        ),
        builder: (context) => PlatformApp.router(
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Primala',
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ),
      ),
    );
  }
}
