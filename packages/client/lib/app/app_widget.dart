import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          canvasColor: Colors.transparent,
          bottomSheetTheme: BottomSheetThemeData(
            showDragHandle: true,
            dragHandleSize: const Size(100, 4),
            dragHandleColor: Colors.white.withOpacity(.5),
            surfaceTintColor: Colors.white.withOpacity(0),
            modalBarrierColor: Colors.transparent,
          )),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      routerConfig: Modular.routerConfig,
    );
  }
}
