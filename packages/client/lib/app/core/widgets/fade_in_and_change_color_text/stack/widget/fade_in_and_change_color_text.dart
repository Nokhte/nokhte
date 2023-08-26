import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInAndChangeColorText extends StatelessWidget {
  final MovieTween movie;
  const FadeInAndChangeColorText({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder(
        control: Control.playFromStart,
        tween: movie,
        duration: movie.duration,
        builder: (context, value, child) {
          return Opacity(
            opacity: value.get('text opacity'),
            child: PlatformText(
              'Waiting On Collaborator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: value.get('text color'),
                  fontSize: 50,
                  fontWeight: FontWeight.w300),
            ),
          );
        });
  }
}
