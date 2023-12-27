import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class JoinSectorsAndFadeOutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          AvailabilitySectorMovieProperties.blueSector1Length,
          Tween<double>(begin: 3.4, end: pi),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Length,
          Tween<double>(
            begin: 3.4,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector3Length,
          Tween<double>(
            begin: 3.4,
            end: pi,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector1Length,
          Tween<double>(
            begin: 3.4,
            end: pi,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector2Length,
          Tween<double>(
            begin: 3.4,
            end: pi,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Length,
          Tween<double>(
            begin: 3.4,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector1Color1,
          ColorTween(
            begin: ModelGradients.userGradient.first,
            end: ModelGradients.userGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector1Color2,
          ColorTween(
            begin: ModelGradients.userGradient[1],
            end: ModelGradients.userGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Color1,
          ColorTween(
            begin: ModelGradients.userGradient.first,
            end: ModelGradients.userGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Color2,
          ColorTween(
            begin: ModelGradients.userGradient[1],
            end: ModelGradients.userGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector3Color1,
          ColorTween(
            begin: ModelGradients.userGradient.first,
            end: ModelGradients.userGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector3Color2,
          ColorTween(
            begin: ModelGradients.userGradient[1],
            end: ModelGradients.userGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector1Color1,
          ColorTween(
            begin: ModelGradients.collaboratorGradient.first,
            end: ModelGradients.collaboratorGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector1Color2,
          ColorTween(
            begin: ModelGradients.collaboratorGradient[1],
            end: ModelGradients.collaboratorGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector2Color1,
          ColorTween(
            begin: ModelGradients.collaboratorGradient.first,
            end: ModelGradients.collaboratorGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector2Color2,
          ColorTween(
            begin: ModelGradients.collaboratorGradient[1],
            end: ModelGradients.collaboratorGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Color1,
          ColorTween(
            begin: ModelGradients.collaboratorGradient.first,
            end: ModelGradients.collaboratorGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Color2,
          ColorTween(
            begin: ModelGradients.collaboratorGradient[1],
            end: ModelGradients.collaboratorGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector1RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector3RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector1RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector2RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3RadiusScalingFactor,
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Color1,
          ColorTween(
            begin: ModelGradients.collaboratorGradient.first,
            end: ModelGradients.successGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Color2,
          ColorTween(
            begin: ModelGradients.collaboratorGradient[1],
            end: ModelGradients.successGradient[1],
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Color1,
          ColorTween(
            begin: ModelGradients.userGradient.first,
            end: ModelGradients.successGradient.first,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Color2,
          ColorTween(
            begin: ModelGradients.userGradient[1],
            end: ModelGradients.successGradient[1],
          ),
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    ).tween(
      AvailabilitySectorMovieProperties.blueSector2RadiusScalingFactor,
      Tween<double>(
        begin: 1,
        end: .97,
      ),
    )
    ..scene(
      begin: Seconds.get(3),
      end: Seconds.get(5),
    )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Length,
          Tween<double>(
            begin: 3.4,
            end: pi,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Length,
          Tween<double>(
            begin: 3.4,
            end: pi,
          ),
        );
  // the next phase will me merging them and then fading them out
}
