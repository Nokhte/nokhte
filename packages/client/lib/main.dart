import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nokhte/app/app_module.dart';
import 'package:nokhte/app/app_widget.dart';
import 'package:nokhte/app/modules/session_starters/session_starters_widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart';
import 'package:quick_actions/quick_actions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  Modular.setInitialRoute('/login/');

  await Hive.initFlutter();

  QuickActions quickActions = const QuickActions();

  quickActions.setShortcutItems(<ShortcutItem>[
    const ShortcutItem(
      type: 'Start Session',
      localizedTitle: 'Start Session',
      icon: 'qr_code',
    ),
    const ShortcutItem(
      type: 'Join Session',
      localizedTitle: 'Join Session',
      icon: 'camera',
    ),
    const ShortcutItem(
      type: 'View Storage',
      localizedTitle: 'View Storage',
      icon: 'doc',
    ),
  ]);

  quickActions.initialize((String shortcutType) {
    switch (shortcutType) {
      case 'Start Session':
        Modular.to.navigate(SessionStarterConstants.sessionStarter);
      case 'Join Session':
        Modular.to.navigate(SessionStarterConstants.sessionJoiner);
      case 'View Storage':
        Modular.to.navigate(StorageConstants.root);
      default:
        break;
    }
  });

  late String supabaseUrl;
  late String supabaseAnonKey;
  if (kDebugMode) {
    supabaseUrl = dotenv.env["DEV_SUPABASE_URL"] ?? '';
    supabaseAnonKey = dotenv.env["DEV_SUPABASE_ANON_KEY"] ?? '';

    // supabaseUrl = dotenv.env["PROD_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["PROD_SUPABASE_ANON_KEY"] ?? '';

    // supabaseUrl = dotenv.env["STAGING_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["STAGING_SUPABASE_ANON_KEY"] ?? '';
  } else {
    supabaseUrl = dotenv.env["PROD_SUPABASE_URL"] ?? '';
    supabaseAnonKey = dotenv.env["PROD_SUPABASE_ANON_KEY"] ?? '';
  }
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(
    ModularApp(
      debugMode: true,
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
