/// main.dart
///
/// This is the entry point of the Primala Flutter app. It sets up the main
/// components and dependencies required for the app's functionality.
///
/// Stack Overview:
/// 1. `dotenv` is used to load environment variables from a `.env` file at the
///    root of the project. The environment variables contain Supabase-related
///    configuration for both development and production environments.
///
/// 2. The Supabase backend-as-a-service is integrated using the
///    `supabase_flutter` package. This integration allows the app to interact
///    with Supabase APIs and manage user authentication, data storage, and
///    real-time features. Note: There is a caveat when running on a local
///    Supabase instance; native Apple authentication won't work as expected.
///
/// 3. The `connectivity_plus` package is used to handle connectivity-related
///    operations. It allows the app to monitor network connectivity status and
///    respond to changes accordingly.
///
/// 4. The `flutter_modular` package is utilized to implement the Modular
///    architecture, providing a feature-based approach for code organization
///    and separation of concerns. The app is divided into modules, and each
///    module represents a self-contained feature or functionality.
///
/// 5. The `AppModule` serves as the root module for the app and defines its
///    core dependencies, including the Supabase client and the connectivity
///    instance.
///
/// 6. The `AppWidget` is the root of the app's widget tree and is used to
///    initialize the user interface and start the app's rendering process.
///
/// How It Works:
/// 1. The `dotenv` package is used to load environment variables from the
///    `.env` file. The environment variables contain Supabase-related
///     configuration URLs and keys for both the development and production
///     environments.
///
/// 2. Depending on whether the app is running in debug mode (`kDebugMode`),
///    the correct Supabase URL and anonymous key are extracted from the
///    environment variables. This allows the app to use the appropriate
///    Supabase instance depending on the build configuration (debug for
///    development and release for production builds).
///
/// 3. The `Supabase.initialize` method is called to set up the Supabase
///    instance with the extracted URL and anonymous key. This initializes the
///    Supabase client, making it ready to interact with the backend service.
///
/// 4. The `supabaseClient` is passed as a dependency to the `AppModule`, along
///    with an instance of the `Connectivity` class from the `connectivity_plus`
///    package. These dependencies are used throughout the app to enable
///    real-time data sync, user authentication, and network connectivity
///    management.
///
/// 5. The `ModularApp` widget is used to wrap the `AppWidget`. The `ModularApp`
///    is responsible for managing the app's routing and dependency injection
///    system provided by `flutter_modular`.
///
/// 6. The `AppModule` is passed to the `ModularApp`, which serves as the root
///    module for the app. This allows the app to access the provided
///    dependencies from `AppModule` and use them across different features and
///    screens within the app.
///
/// 7. Finally, the `AppWidget` is run using the `runApp` function, making it
///    the entry point of the app's user interface. The `AppWidget` initializes
///    the main user interface components and starts rendering the app's UI.

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
    // supabaseUrl = dotenv.env["DEV_SUPABASE_URL"] ?? '';
    // supabaseAnonKey = dotenv.env["DEV_SUPABASE_ANON_KEY"] ?? '';
    supabaseUrl = dotenv.env["PROD_SUPABASE_URL"] ?? '';
    supabaseAnonKey = dotenv.env["PROD_SUPABASE_ANON_KEY"] ?? '';
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
