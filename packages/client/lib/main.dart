import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:nokhte/app/app_module.dart';
import 'package:nokhte/app/app_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  Modular.setInitialRoute('/login/');

  String glassfyAPIKey = dotenv.env['GLASSFY_PROD_API_KEY'] ?? '';

  if (Platform.isIOS && dotenv.env["APP_ID"] == 'com.nokhte.staging') {
    glassfyAPIKey = dotenv.env['GLASSFY_STAGING_API_KEY'] ?? '';
  }

  await Glassfy.initialize(glassfyAPIKey);

  late String supabaseUrl;
  late String supabaseAnonKey;
  if (kDebugMode) {
    // supabaseUrl = dotenv.env["DEV_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["DEV_SUPABASE_ANON_KEY"] ?? '';

    // supabaseUrl = dotenv.env["PROD_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["PROD_SUPABASE_ANON_KEY"] ?? '';

    supabaseUrl = dotenv.env["STAGING_SUPABASE_URL"] ?? '';
    supabaseAnonKey = dotenv.env["STAGING_SUPABASE_ANON_KEY"] ?? '';
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
