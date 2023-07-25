import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/modules/home/presentation/widgets/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  final SupabaseClient supabase;
  const HomeScreen({
    Key? key,
    required this.supabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF66CF90),
              Color(0xFF88C9B9),
              Color(0xFF51A18D),
              Color(0xFF3E8077),
              Color(0xFF274D4F),
              Color(0xFF1D3741),
              Color(0xFF122430),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Column(
          children: [
            Expanded(
              child: SizedBox(), // Empty SizedBox to take up available space
            ),
            SafeArea(
              child: Center(
                child: BreathingPentagonsButton(),
              ),
            ),
            Padding(padding: EdgeInsets.all(40))
          ],
        ),
      ),
    );
  }
}
