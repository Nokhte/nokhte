import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  final SupabaseClient supabase;
  const HomeScreen({
    Key? key,
    required this.supabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
          child: Center(
              child: PlatformElevatedButton(
                  onPressed: () async {
                    // print(
                    //     supabase.auth.currentUser?.userMetadata?["full_name"] ??
                    //         supabase.auth.currentUser?.userMetadata?["name"]);
                    await supabase.auth.signOut();
                    Modular.to.navigate('/');
                  },
                  child: PlatformText("Log OUT")))),
    );
  }
}
