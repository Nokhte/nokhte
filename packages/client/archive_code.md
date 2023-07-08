# Archive Code

Sign Out Button Screen

```dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala/keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

   final String userID =
       Supabase.instance.client.auth.currentUser?.id ?? "No UID??";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return PlatformScaffold(
          body: Center(
                 PlatformElevatedButton(
                key: K.signOutButton,
                child: const Text("Sign Out"),
                onPressed: () async {
                   await Supabase.instance.client.auth.signOut();
                   Modular.to.navigate('/');
                },
               ),
              ),
        );
      },
    );
  }
}
```
NO NO NO FIX IT!!!!