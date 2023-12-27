import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class SetupAvailabilitySectorsMovies {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(3),
    )
        .tween(
          AvailabilitySectorMovieProperties.blueSector1Length,
          Tween<double>(
            begin: pi,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector2Length,
          Tween<double>(
            begin: pi,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.blueSector3Length,
          Tween<double>(
            begin: pi,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector1Length,
          Tween<double>(
            begin: pi,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector2Length,
          Tween<double>(
            begin: pi,
            end: 3.4,
          ),
        )
        .tween(
          AvailabilitySectorMovieProperties.redSector3Length,
          Tween<double>(
            begin: pi,
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
        );
}
