import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

mixin BeachWaveMovieModesLookup {
  static Map<BeachWaveMovieModes, BaseBeachWaveMovieStore> lookup = {
    BeachWaveMovieModes.blackOut: StaticBlackOutMovieStore(),
    BeachWaveMovieModes.blackOutToDrySand: BlackOutToDrySandMovieStore(),
    BeachWaveMovieModes.drySandToVibrantBlueGrad:
        DrySandToVibrantBlueGradMovieStore(),
    BeachWaveMovieModes.halfAndHalfToDrySand: HalfAndHalfToDrySandMovieStore(),
    BeachWaveMovieModes.depthsToTimesUpStart: DepthsToTimesUpStartMovieStore(),
    BeachWaveMovieModes.none: BaseBeachWaveMovieStore(),
    BeachWaveMovieModes.oceanDiveToOnShore: OceanDiveToOnShoreMovieStore(),
    BeachWaveMovieModes.oceanDiveToTimesUp: OceanDiveToTimesUpStartMovieStore(),
    BeachWaveMovieModes.oceanDiveToVibrantBlueGradient:
        OceanDiveToVibrantBlueGradientMovieStore(),
    BeachWaveMovieModes.onShore: OnShoreMovieStore(),
    BeachWaveMovieModes.onShoreToOceanDive: OnShoreToOceanDiveMovieStore(),
    BeachWaveMovieModes.onShoreToVibrantBlue: OnShoreToVibrantBlueMovieStore(),
    BeachWaveMovieModes.resumeOnShore: ResumeOnShoreMovieStore(),
    BeachWaveMovieModes.staticHalfAndHalf: StaticHalfAndHalfMovieStore(),
    BeachWaveMovieModes.staticDepths: StaticDepthsMovieStore(),
    BeachWaveMovieModes.staticOceanDive: StaticOceanDiveStore(),
    BeachWaveMovieModes.timesUp: TimesUpMovieStore(),
    BeachWaveMovieModes.timesUpDynamicPointToTheDepths:
        TimesUpDynamicPointToTheDepthsMovieStore(),
    BeachWaveMovieModes.timesUpDynamicPointToTimesUpStart:
        TimesUpDynamicPointToTimesUpStartMovieStore(),
    BeachWaveMovieModes.timesUpEndToOceanDive:
        TimesUpEndToOceanDiveMovieStore(),
    BeachWaveMovieModes.timesUpEndToTheDepths:
        TimesUpEndToOceanDiveMovieStore(),
    BeachWaveMovieModes.timesUpEndToTimesUpStart:
        TimesUpEndToTimesUpStartMovieStore(),
    BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf:
        VibrantBlueGradToHalfAndHalfMovieStore(),
    BeachWaveMovieModes.vibrantBlueGradientToTimesUp:
        VibrantBlueGradientToTimesUpMovieStore(),
    BeachWaveMovieModes.waterFromTopToOnShorePt1:
        WaterFromTopToOnShoreMoviePart1Store(),
    BeachWaveMovieModes.waterFromTopToOnShorePt2:
        WaterFromTopToOnShoreMoviePart2Store(),
  };
}
