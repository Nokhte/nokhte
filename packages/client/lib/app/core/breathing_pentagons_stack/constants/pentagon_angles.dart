/// pentagon_angles.dart
///
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th, 2023
///
/// Author: Sonny Vesali
///
/// A simple class that provides the starting angles for each of the three pentagons
/// used in the animation. These angles determine the initial rotation positions of the
/// pentagons before any animation takes place.
///
/// The class contains the following static getter methods:
///
/// - pentagon1Angle: Returns a double value representing the starting angle for
/// the first pentagon. The angle is set to -0.3.
///
/// - pentagon2Angle: Returns a double value representing the starting angle for
/// the second pentagon. The angle is set to 1.35.
///
/// - pentagon3Angle: Returns a double value representing the starting angle for
/// the third pentagon. The angle is set to 1.75.
///
/// These starting angles define the initial positions of the pentagons, and they are used
/// as the starting point for any animations that involve rotating the pentagons. The angles
/// are provided in radians and are relative to the original positions of the pentagons.

class PentagonAngles {
  static double get pentagon1Angle => -0.3;
  static double get pentagon2Angle => 1.35;
  static double get pentagon3Angle => 1.75;
}
