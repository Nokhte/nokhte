import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

mixin HomeNavigation on Reactions {
  SwipeGuideStore get swipeGuide;
  InstructionalGradientNokhteStore get homeInstructionalNokhte;
  CenterInstructionalNokhteStore get centerInstructionalNokhte;

  initHomeNavigationReactions() {
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(homeInstructionalNokhteReactor());
  }

  centerInstructionalNokhteReactor() => reaction(
        (p0) => centerInstructionalNokhte.movieStatus,
        (p0) {
          if (p0 == MovieStatus.finished &&
              centerInstructionalNokhte.movieMode ==
                  CenterInstructionalNokhteMovieModes.moveAround) {
            homeInstructionalNokhte.explode();
          }
        },
      );

  homeInstructionalNokhteReactor() =>
      reaction((p0) => homeInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            homeInstructionalNokhte.movieMode ==
                GradientNokhteMovieModes.explode) {
          Modular.to.navigate(SessionStarterConstants.sessionStarterExit);
        }
      });
}
