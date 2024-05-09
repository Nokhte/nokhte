import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
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
  final glassfyAPIKey = dotenv.env['GLASSFY_API_KEY'] ?? '';
  if (glassfyAPIKey.isNotEmpty) {
    await Glassfy.initialize(glassfyAPIKey);
  }

  bool shouldUseTestKey = false;

  if (dotenv.env["PROD_SUPABASE_URL"]!.contains('oczkzhgjpgeyqrgtqjag') ||
      kDebugMode) {
    shouldUseTestKey = true;
  }

  await FlutterBranchSdk.init(
    useTestKey: shouldUseTestKey,
  );

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
