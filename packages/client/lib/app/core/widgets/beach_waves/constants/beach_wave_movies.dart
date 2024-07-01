import 'package:nokhte/app/core/widgets/widgets.dart';

mixin BeachWaveMovies {
  static Map<BeachWaveMovieModes, BaseBeachWaveMovieStore> getMap() => {
        BeachWaveMovieModes.anyToOnShore: AnyToOnShoreMovieStore(),
        BeachWaveMovieModes.anyToSky: AnyToSkyMovieStore(),
        BeachWaveMovieModes.anyToHalfAndHalf: AnyToHalfAndHalfMovieStore(),
        BeachWaveMovieModes.anyToInvertedHalfAndHalf:
            AnyToInvertedHalfAndHalfMovieStore(),
        BeachWaveMovieModes.borealisToSky: BorealisToSkyMovieStore(),
        BeachWaveMovieModes.blackOut: StaticBlackOutMovieStore(),
        BeachWaveMovieModes.blackOutToDrySand: BlackOutToDrySandMovieStore(),
        BeachWaveMovieModes.deepSeaToBorealis: DeepSeaToBorealisMovieStore(),
        BeachWaveMovieModes.deepSeaToSky: DeepSeaToSkyMovieStore(),
        BeachWaveMovieModes.deepSeaToHalfAndHalf:
            DeepSeaToHalfAndHalfMovieStore(),
        BeachWaveMovieModes.deepSeaToInvertedHalfAndHalf:
            DeepSeaToInvertedHalfAndHalfMovieStore(),
        BeachWaveMovieModes.drySandToSky: DrySandToSkyMovieStore(),
        BeachWaveMovieModes.halfAndHalfToDrySand:
            HalfAndHalfToDrySandMovieStore(),
        BeachWaveMovieModes.invertedOnShore: InvertedOnShoreMovieStore(),
        BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea:
            InvertedOnShoreToInvertedDeepSeaMovieStore(),
        BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive:
            InvertedOnShoreToInvertedOceanDiveMovieStore(),
        BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue:
            InvertedOnShoreToInvertedDeeperBlueMovieStore(),
        BeachWaveMovieModes.invertedHalfAndHalfToDrySand:
            InvertedHalfAndHalfToDrySandMovieStore(),
        BeachWaveMovieModes.none: BaseBeachWaveMovieStore(),
        BeachWaveMovieModes.oceanDiveToSky: OceanDiveToSkyMovieStore(),
        BeachWaveMovieModes.onShore: OnShoreMovieStore(),
        BeachWaveMovieModes.onShoreToDeepSea: OnShoreToDeepSeaMovieStore(),
        BeachWaveMovieModes.onShoreToDrySand: OnShoreToDrySandMovieStore(),
        BeachWaveMovieModes.onShoreToOceanDive: OnShoreToOceanDiveMovieStore(),
        BeachWaveMovieModes.onShoreToSky: OnShoreToSkyMovieStore(),
        BeachWaveMovieModes.orangeSandToSky: OrangeSandToSkyMovieStore(),
        BeachWaveMovieModes.orangeSandToHalfAndHalf:
            OrangeSandToHalfAndHalfMovieStore(),
        BeachWaveMovieModes.resumeOnShore: ResumeOnShoreMovieStore(),
        BeachWaveMovieModes.staticHalfAndHalf: StaticHalfAndHalfMovieStore(),
        BeachWaveMovieModes.staticInvertedDeeperBlue:
            StaticInvertedDeeperBlueMovieStore(),
        BeachWaveMovieModes.staticOceanDive: StaticOceanDiveStore(),
        BeachWaveMovieModes.skyToHalfAndHalf: SkyToHalfAndHalfMovieStore(),
        BeachWaveMovieModes.skyToInvertedHalfAndHalf:
            SkyToInvertedHalfAndHalfMovieStore(),
        BeachWaveMovieModes.skyToDrySand: SkyToDrySandMovieStore(),
        BeachWaveMovieModes.waterFromTopToOnShorePt1:
            WaterFromTopToOnShoreMoviePart1Store(),
        BeachWaveMovieModes.waterFromTopToOnShorePt2:
            WaterFromTopToOnShoreMoviePart2Store(),
      };
}
