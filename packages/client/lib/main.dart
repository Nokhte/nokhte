import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/app_module.dart';
import 'package:primala/app/app_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart';

void main() async {
  await dotenv.load();
  late String supabaseUrl;
  final String supabaseAnonKey;
  if (kDebugMode) {
    /// # Local Supabase Stack
    supabaseUrl = dotenv.env["DEV_SUPABASE_URL"] ?? '';
    supabaseAnonKey = dotenv.env["DEV_SUPABASE_ANON_KEY"] ?? '';

    /// # PRODUCTION Supabase Stack
    // supabaseUrl = dotenv.env["PROD_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["PROD_SUPABASE_ANON_KEY"] ?? '';
    /// # STAGING Supabase Stack
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
  final supabaseClient = Supabase.instance.client;

  runApp(
    ModularApp(
      debugMode: true,
      module: AppModule(
        supabase: supabaseClient,
        connectivityInstance: Connectivity(),
      ),
      child: const AppWidget(),
    ),
  );
}
